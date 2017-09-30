package org.wingstudio.lucene;

import java.io.StringReader;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery.Builder;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wingstudio.entity.Source;
import org.wingstudio.util.DateUtil;
import org.wingstudio.util.StringUtil;

public class SourceIndex
{
  private Directory dir;

  public SourceIndex()
  {
    this.dir = null;
  }

  private IndexWriter getWriter()
    throws Exception
  {
    this.dir = FSDirectory.open(Paths.get("C:\\hgc\\index\\source", new String[0]));
    SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
    IndexWriterConfig iwc = new IndexWriterConfig(analyzer);
    IndexWriter writer = new IndexWriter(this.dir, iwc);
    return writer;
  }

  public void addIndex(Source source)
    throws Exception
  {
    IndexWriter writer = getWriter();
    Document doc = new Document();

    doc.add(new StringField("id", String.valueOf(source.getId()), Field.Store.YES));
    doc.add(new TextField("title", source.getTitle(), Field.Store.YES));
    doc.add(new TextField("sourceSize", source.getSourceSize(), Field.Store.YES));
    doc.add(new TextField("downHit", String.valueOf(source.getDownHit()), Field.Store.YES));
    doc.add(new StringField("releaseDate", DateUtil.formatDate(source.getReleaseDate(), "yyyy-MM-dd"), Field.Store.YES));
    writer.addDocument(doc);
    writer.close();
  }

  public void updateIndex(Source source) throws Exception {
    IndexWriter writer = getWriter();
    Document doc = new Document();
    doc.add(new StringField("id", String.valueOf(source.getId()), Field.Store.YES));
    doc.add(new TextField("title", source.getTitle(), Field.Store.YES));
    doc.add(new StringField("releaseDate", DateUtil.formatDate(source.getReleaseDate(), "yyyy-MM-dd"), Field.Store.YES));

    writer.updateDocument(new Term("id", String.valueOf(source.getId())), doc);
    writer.close();
  }

  public List<Source> searchSource(String q) throws Exception {
    this.dir = FSDirectory.open(Paths.get("C:\\hgc\\index\\source", new String[0]));
    IndexReader reader = DirectoryReader.open(this.dir);
    IndexSearcher is = new IndexSearcher(reader);
    BooleanQuery.Builder booleanQuery = new BooleanQuery.Builder();
    SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
    QueryParser parser = new QueryParser("title", analyzer);
    Query query = parser.parse(q);
    QueryParser parser2 = new QueryParser("content", analyzer);
    Query query2 = parser2.parse(q);
    booleanQuery.add(query, BooleanClause.Occur.SHOULD);
    booleanQuery.add(query2, BooleanClause.Occur.SHOULD);
    TopDocs hits = is.search(booleanQuery.build(), 100);
    QueryScorer scorer = new QueryScorer(query);
    Fragmenter fragmenter = new SimpleSpanFragmenter(scorer);
    SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
    Highlighter highlighter = new Highlighter(simpleHTMLFormatter, scorer);
    highlighter.setTextFragmenter(fragmenter);
    List fileList = new LinkedList();
    for (ScoreDoc scoreDoc : hits.scoreDocs) {
      Document doc = is.doc(scoreDoc.doc);
      Source news = new Source();
      news.setId(Integer.valueOf(Integer.parseInt(doc.get("id"))));
      news.setDownHit(Integer.valueOf(Integer.parseInt(doc.get("downHit"))));
      news.setReleaseDateStr(doc.get("releaseDate"));
      String title = doc.get("title");
      String content = doc.get("content");
      TokenStream tokenStream;
      if (title != null) {
        tokenStream = analyzer.tokenStream("title", new StringReader(title));
        String hTitle = highlighter.getBestFragment(tokenStream, title);
        if (StringUtil.isEmpty(hTitle))
          news.setTitle(title);
        else {
          news.setTitle(hTitle);
        }
      }
      if (content != null) {
        tokenStream = analyzer.tokenStream("content", new StringReader(content));
        String hContent = highlighter.getBestFragment(tokenStream, content);
        if (StringUtil.isEmpty(hContent)) {
          if (content.length() <= 200)
            news.setContentNoTag(content);
          else
            news.setContentNoTag(content.substring(0, 200));
        }
        else {
          news.setContentNoTag(hContent);
        }
      }
      fileList.add(news);
    }
    return fileList;
  }
}
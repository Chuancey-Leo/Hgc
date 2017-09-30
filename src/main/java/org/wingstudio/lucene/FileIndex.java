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
import org.wingstudio.entity.File;
import org.wingstudio.entity.News;
import org.wingstudio.util.DateUtil;
import org.wingstudio.util.StringUtil;

public class FileIndex
{
  private Directory dir;

  public FileIndex()
  {
    this.dir = null;
  }

  private IndexWriter getWriter()
    throws Exception
  {
    this.dir = FSDirectory.open(Paths.get("C:\\hgc\\index\\file", new String[0]));
    SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
    IndexWriterConfig iwc = new IndexWriterConfig(analyzer);
    IndexWriter writer = new IndexWriter(this.dir, iwc);
    return writer;
  }

  public void addIndex(File file)
    throws Exception
  {
    IndexWriter writer = getWriter();
    Document doc = new Document();

    doc.add(new StringField("id", String.valueOf(file.getId()), Field.Store.YES));
    doc.add(new TextField("title", file.getTitle(), Field.Store.YES));
    doc.add(new StringField("releaseDate", DateUtil.formatDate(file.getReleaseDate(), "yyyy-MM-dd"), Field.Store.YES));
    writer.addDocument(doc);
    writer.close();
  }

  public void updateIndex(News news) throws Exception {
    IndexWriter writer = getWriter();
    Document doc = new Document();
    doc.add(new StringField("id", String.valueOf(news.getId()), Field.Store.YES));
    doc.add(new TextField("title", news.getTitle(), Field.Store.YES));
    doc.add(new StringField("releaseDate", DateUtil.formatDate(news.getReleaseDate(), "yyyy-MM-dd"), Field.Store.YES));

    writer.updateDocument(new Term("id", String.valueOf(news.getId())), doc);
    writer.close();
  }

  public List<File> searchFile(String q)
    throws Exception
  {
    this.dir = FSDirectory.open(Paths.get("C:\\hgc\\index\\file", new String[0]));
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
      File news = new File();
      news.setId(Integer.valueOf(Integer.parseInt(doc.get("id"))));
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
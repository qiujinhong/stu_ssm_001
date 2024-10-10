package com.codejams.service;

import com.codejams.domain.Book;
import com.codejams.mapper.AdminMapper;
import com.codejams.mapper.BookMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class BookService {

    static BookMapper bookMapper = null;
    static {

        try {
            InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapperConfig.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            SqlSession sqlSession = sqlSessionFactory.openSession(true);
            bookMapper = sqlSession.getMapper(BookMapper.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Book> findAllBook(){
        return bookMapper.findAllBook();
    }

    public Book findBookById(int id){
        return bookMapper.findBookById(id);
    }

    public void update(Book book){
        bookMapper.update(book);
    }

    public void save(Book book){
        bookMapper.save(book);
    }

    public void delete(int id){
        bookMapper.delete(id);
    }

    public List<Book> findBookByCondition(String condition){
        return bookMapper.findBookByCondition(condition);
    }

    public void changeStatusToLeisure(String name){
        bookMapper.changeStatusToLeisure(name);
    }

    public void changeStatusToNotLeisure(String name){
        bookMapper.changeStatusToNotLeisure(name);
    }
}

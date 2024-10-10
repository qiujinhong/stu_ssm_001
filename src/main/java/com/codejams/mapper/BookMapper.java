package com.codejams.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.codejams.domain.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface BookMapper{

    List<Book> findAllBook();

    Book findBookById(int id);

    void update(Book book);

    void save(Book book);

    void delete(int id);

    List<Book> findBookByCondition(String condition);

    void changeStatusToLeisure(String name);

    void changeStatusToNotLeisure(String name);

}

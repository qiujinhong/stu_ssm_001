package com.codejams.service;

import com.codejams.domain.Borrower;
import com.codejams.mapper.BookMapper;
import com.codejams.mapper.BorrowerMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class BorrowerService {

    static BorrowerMapper borrowerMapper = null;
    static BookMapper bookMapper = null;
    static {

        try {
            InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapperConfig.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            SqlSession sqlSession = sqlSessionFactory.openSession(true);
            borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
            bookMapper = sqlSession.getMapper(BookMapper.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Borrower> findAllBorrower(){
        return borrowerMapper.findAllBorrower();
    }

    public Borrower findBorrowerById(int id){
        return borrowerMapper.findBorrowerById(id);
    }

    public void update(Borrower borrower){

        borrowerMapper.update(borrower);
    }

    public void save(Borrower borrower){
        //保存信息
        borrowerMapper.save(borrower);

    }


    public void delete(int id){
        borrowerMapper.delete(id);
    }

    public List<Borrower> findBorrowerByCondition(String condition){
        return borrowerMapper.findBorrowerByCondition(condition);
    }
}

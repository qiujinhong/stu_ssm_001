package com.codejams.service;

import com.codejams.domain.Admin;
import com.codejams.mapper.AdminMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class AdminService {

    static AdminMapper adminMapper = null;
    static {

        try {
            InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapperConfig.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            SqlSession sqlSession = sqlSessionFactory.openSession(true);
            adminMapper = sqlSession.getMapper(AdminMapper.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean login(Admin admin){
        Admin a = adminMapper.login(admin);
        if (a != null){
            return true;
        }else {
            return false;
        }
    }


}

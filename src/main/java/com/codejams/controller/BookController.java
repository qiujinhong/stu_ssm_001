package com.codejams.controller;

import com.codejams.domain.Admin;
import com.codejams.domain.Book;
import com.codejams.service.AdminService;
import com.codejams.service.BookService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@CrossOrigin
@Controller
@RequestMapping("/book")
public class BookController {

    private BookService bookService = new BookService();
    private AdminService adminService = new AdminService();

    @RequestMapping("/findAllBook")
    public ModelAndView findAllBook(){

        ModelAndView modelAndView = new ModelAndView();

        List<Book> bookList = bookService.findAllBook();

        //设置视图
        modelAndView.setViewName("/workbench/activity/index.jsp");
        modelAndView.addObject("bookList",bookList);

        return modelAndView;
    }

    @RequestMapping("/findBookByCondition")
    public ModelAndView findBookByCondition(String condition){

        ModelAndView modelAndView = new ModelAndView();

        System.out.println(condition);
        List<Book> bookList = bookService.findBookByCondition(condition);
        for (Book book : bookList) {
            System.out.println(book);
        }


        //设置视图
        modelAndView.setViewName("/workbench/activity/index.jsp");
        modelAndView.addObject("bookList",bookList);

        return modelAndView;
    }

    @RequestMapping("/login")
    public String login(Admin admin){

        System.out.println(admin);
        boolean flag = adminService.login(admin);
        if(flag){
            //登录成功
            return "redirect:/workbench/index.jsp";
        }else{
            //登录失败
            System.out.println("222");
            return "redirect:../login.jsp";
        }
    }

    @RequestMapping("/save")
    public String save(Book book){
        System.out.println(book);
        bookService.save(book);
        return "redirect:findAllBook";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        bookService.delete(id);
        return "redirect:findAllBook";
    }

    @RequestMapping("/update")
    public String update(Book book){
        System.out.println(book);
        bookService.update(book);

        return "redirect:findAllBook";
    }

    @RequestMapping(value = "/findBook", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findBook(String id){
        int bid = Integer.parseInt(id);
        System.out.println(bid);

        Book book = bookService.findBookById(bid);
        System.out.println(book);

        ObjectMapper objectMapper = new ObjectMapper();

        String json = null;
        try {
            json = objectMapper.writeValueAsString(book);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }



}

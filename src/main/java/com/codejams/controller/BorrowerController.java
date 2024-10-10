package com.codejams.controller;

import com.codejams.domain.Book;
import com.codejams.domain.Borrower;
import com.codejams.service.BookService;
import com.codejams.service.BorrowerService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/borrower")
public class BorrowerController {

    private BorrowerService borrowerService = new BorrowerService();
    private BookService bookService = new BookService();


    @RequestMapping("/findAllBorrower")
    public ModelAndView findAllBorrower(){

        ModelAndView modelAndView = new ModelAndView();

        List<Borrower> borrowerList = borrowerService.findAllBorrower();
        List<Book> bookList = bookService.findAllBook();

        //设置视图
        modelAndView.setViewName("/workbench/activity/borrower-list.jsp");
        modelAndView.addObject("borrowerList",borrowerList);
        modelAndView.addObject("bookList",bookList);

        return modelAndView;
    }

    @RequestMapping("/findBorrowerByCondition")
    public ModelAndView findBookByCondition(String condition){

        ModelAndView modelAndView = new ModelAndView();

        System.out.println(condition);
        List<Borrower> borrowerList = borrowerService.findBorrowerByCondition(condition);
        List<Book> bookList = bookService.findAllBook();
        for (Borrower borrower : borrowerList) {
            System.out.println(borrower);
        }


        //设置视图
        modelAndView.setViewName("/workbench/activity/borrower-list.jsp");
        modelAndView.addObject("borrowerList",borrowerList);
        modelAndView.addObject("bookList",bookList);

        return modelAndView;
    }

    @RequestMapping("/save")
    public String save(Borrower borrower){
        System.out.println(borrower);
        borrowerService.save(borrower);

        //保存后将改书的状态改为已借出
        bookService.changeStatusToNotLeisure(borrower.getBook());

        return "redirect:findAllBorrower";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        Borrower borrower = borrowerService.findBorrowerById(id);
        //将对应的书修改为空闲状态
        bookService.changeStatusToLeisure(borrower.getBook());
        borrowerService.delete(id);

        return "redirect:findAllBorrower";
    }

    @RequestMapping("/update")
    public String update(Borrower borrower){
        System.out.println(borrower);
        //修改前先将书的状态改为空闲
        int id = borrower.getId();
        Borrower bor = borrowerService.findBorrowerById(id);
        bookService.changeStatusToLeisure(bor.getBook());

        borrowerService.update(borrower);
        bookService.changeStatusToNotLeisure(borrower.getBook());


        return "redirect:findAllBorrower";
    }

    @RequestMapping(value = "/findBorrower", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findBorrower(String id){
        int bid = Integer.parseInt(id);
        System.out.println(bid);

        Borrower borrower = borrowerService.findBorrowerById(bid);
        System.out.println(borrower);

        ObjectMapper objectMapper = new ObjectMapper();

        String json = null;
        try {
            json = objectMapper.writeValueAsString(borrower);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }

}

package com.codejams.mapper;

import com.codejams.domain.Book;
import com.codejams.domain.Borrower;

import java.util.List;

public interface BorrowerMapper {

    List<Borrower> findAllBorrower();

    Borrower findBorrowerById(int id);

    void update(Borrower borrower);

    void save(Borrower borrower);

    void delete(int id);

    List<Borrower> findBorrowerByCondition(String condition);
}

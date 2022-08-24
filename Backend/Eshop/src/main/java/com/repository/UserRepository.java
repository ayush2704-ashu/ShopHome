package com.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.User;

import java.util.Collection;



public interface UserRepository extends JpaRepository<User, String> {
    User findByEmail(String email);
    Collection<User> findAllByRole(String role);

}

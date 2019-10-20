package net.skhu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.User;
import net.skhu.mapper.UserMapper;

@Controller
@RequestMapping("/page")
public class PageController {
    @Autowired UserMapper userMapper;

    @RequestMapping(value="home", method=RequestMethod.GET)
    public String list() {
        return "page/home";
    }
    @RequestMapping(value="searchingSong", method=RequestMethod.GET)
    public String searching() {
        return "page/searchingSong";
    }
    @RequestMapping(value="user", method=RequestMethod.GET)
    public String user() {
        return "page/user";
    }
    @RequestMapping(value="login", method=RequestMethod.GET)
    public String login() {
        return "page/login";
    }
    @RequestMapping(value="join", method=RequestMethod.GET)
    public String join() {
        return "page/join";
    }
    @RequestMapping(value="map", method=RequestMethod.GET)
    public String map() {
        return "page/map";
    }
    @RequestMapping(value="notice", method=RequestMethod.GET)
    public String notice() {
        return "page/notice";
    }
    @RequestMapping(value="chartBoard", method=RequestMethod.GET)
    public String chartBoard() {
        return "page/chartBoard";
    }
    @RequestMapping(value="bestBoard", method=RequestMethod.GET)
    public String bestBoard() {
        return "page/bestBoard";
    }
    @RequestMapping(value="freeBoard", method=RequestMethod.GET)
    public String freeBoard() {
        return "page/freeBoard";
    }
    @RequestMapping(value="tipBoard", method=RequestMethod.GET)
    public String tipBoard() {
        return "page/tipBoard";
    }
    @RequestMapping(value="recommendBoard", method=RequestMethod.GET)
    public String recommendBoard() {
        return "page/recommendBoard";
    }
    @RequestMapping(value="boastBoard", method=RequestMethod.GET)
    public String boastBoard() {
        return "page/boastBoard";
    }
    @RequestMapping(value="relative", method=RequestMethod.GET)
    public String relative() {
        return "page/relative";
    }
    @RequestMapping(value="findId", method=RequestMethod.GET)
    public String findId() {
        return "page/findId";
    }
    @RequestMapping(value="findPw", method=RequestMethod.GET)
    public String findPw() {
        return "page/findPw";
    }
    @RequestMapping(value="findIdNext", method=RequestMethod.GET)
    public String findIdNext() {
        return "page/findIdNext";
    }
    @RequestMapping(value="findPwNext", method=RequestMethod.GET)
    public String findPwNext() {
        return "page/findPwNext";
    }
    @RequestMapping(value="joinNext", method=RequestMethod.GET)
    public String joinNext() {
        return "page/joinNext";
    }
    @RequestMapping(value="postWrite", method=RequestMethod.GET)
    public String postWrite() {
        return "page/postWrite";
    }
    @RequestMapping(value="join", method=RequestMethod.POST)
    public String join(Model model, User user) {
        userMapper.insert(user);
        System.out.println("post!!!!!!!!!!!");
        return "page/join_success";
    }
}

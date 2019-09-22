package net.skhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/page")
public class PageController {

    @RequestMapping(value="chartBoard", method=RequestMethod.GET)
    public String board() {
        return "page/chartBoard";
    }
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
    @RequestMapping(value="join_next", method=RequestMethod.GET)
    public String join_next() {
        return "page/join_next";
    }
    @RequestMapping(value="map", method=RequestMethod.GET)
    public String map() {
        return "page/map";
    }
    @RequestMapping(value="notice", method=RequestMethod.GET)
    public String notice() {
        return "page/notice";
    }
}

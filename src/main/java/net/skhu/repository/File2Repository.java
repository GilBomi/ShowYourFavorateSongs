package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.domain.File2;
import net.skhu.domain.Post;

public interface File2Repository extends JpaRepository<File2, Integer>{
	List<File2> findAllByPost(Post post);

}

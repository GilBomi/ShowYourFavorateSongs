package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.domain.Song;

public interface SongRepositroy extends JpaRepository<Song,Integer>{
	List<Song> findByTitleIgnoreCaseContaining(String title);
	List<Song> findBySingerIgnoreCaseContaining(String singer);
}

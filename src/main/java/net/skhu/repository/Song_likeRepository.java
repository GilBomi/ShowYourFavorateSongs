package net.skhu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.domain.Song_like;

public interface Song_likeRepository extends JpaRepository<Song_like,Integer>{
	@Query("select s from Song_like s where s.song.song_id=:song_id")
	Song_like ExistBySong_id(@RequestParam("song_id") int song_id);

}

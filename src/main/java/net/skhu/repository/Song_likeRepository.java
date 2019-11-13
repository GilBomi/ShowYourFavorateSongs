package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.domain.Song_like;

public interface Song_likeRepository extends JpaRepository<Song_like,Integer>{
	@Query("select s from Song_like s where s.song.song_id=:song_id")
	Song_like ExistBySong_id(@RequestParam("song_id") int song_id);

	@Query("select s from Song_like s where s.user.user_idx=:user_idx and s.song.kara_type=:kara_type")
	List<Song_like> findByUser_idxAndKara_type(@RequestParam("user_idx") int user_idx,@RequestParam("kara_type") int kara_type);
}

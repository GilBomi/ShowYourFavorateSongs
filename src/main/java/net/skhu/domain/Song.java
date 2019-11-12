package net.skhu.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
//@EqualsAndHashCode(exclude = {"user","reply_likes","comment"})
//@ToString(exclude = {"user","reply_likes","comment"})
public class Song {

	//기본키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int song_id;

	String title;
	String singer;
	int song_num;
	int kara_type;

}

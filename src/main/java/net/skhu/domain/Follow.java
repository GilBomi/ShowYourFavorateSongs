package net.skhu.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;


@Data
@Entity
public class Follow {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int follow_id;

	@ManyToOne
	@JoinColumn(name = "user_idx", insertable=false, updatable=false) // insertable,updatable=false를 써야지 같은 name인 ManyToOne을 쓸 수 있음
	User user;

	@ManyToOne
	@JoinColumn(name = "user_idx", insertable=false, updatable=false)
	User target_user;
}

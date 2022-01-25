package com.human.page;

import java.util.ArrayList;

import com.human.page.Member;

public interface Member {

	void insertMember(String name, String gender, String userid, String passcode1, String interest);
	ArrayList<Regi> getMemberList();
	void updateMember(String userid);
	void deleteMember(String userid);
}

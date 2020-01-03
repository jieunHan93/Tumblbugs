package com.tumblbugs.vo;

public class SessionVO {
		boolean result;
		String name,email,profile_simg, member_id;
		public boolean isResult() {
			return result;
		}
		public void setResult(boolean result) {
			this.result = result;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getProfile_simg() {
			return profile_simg;
		}
		public void setProfile_simg(String profile_simg) {
			this.profile_simg = profile_simg;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		
}

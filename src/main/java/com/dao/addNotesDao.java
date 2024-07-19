package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.addNotes;

public class addNotesDao {
	private Connection conn;

	public addNotesDao(Connection conn) {
		super();
		this.conn = conn;
	}
 
	public boolean AddNotes(String ti,String co,int ui) {
		boolean f=false;
		try {
			String query="insert into addNotes(title,content,uid) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,ti);
			ps.setString(2, co);
			ps.setInt(3, ui);
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();						
		}
		return f;
	}
	public List<addNotes> getData(int id) {
		List<addNotes> list=new ArrayList<addNotes>();
			
		addNotes add=null;
		
	
			try {
				String query="select * from addnotes where uid=? order by id DESC";
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setInt(1,id);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					add=new addNotes();
					add.setId(rs.getInt(1));
					add.setTitle(rs.getString(2));
					add.setContent(rs.getString(3));
					add.setPdate(rs.getDate(4));
					list.add(add);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	public addNotes getDataById(int noteId) {
		addNotes ad=null;
		try {
			String query="select * from addNotes where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1,noteId);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ad=new addNotes();
				ad.setId(rs.getInt(1));
				ad.setTitle(rs.getString(2));
				ad.setContent(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ad;
	}
	public boolean NoteUpdate(int nid,String ti,String co) {
		boolean f=false;
				try {
					String query="update addNotes set title=?,content=? where id=?";
					PreparedStatement ps=conn.prepareStatement(query);
					ps.setString(1, ti);
					ps.setString(2, co);
					ps.setInt(3,nid);
					
					int i=ps.executeUpdate();
					if(i==1) {
						f=true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		return f;
	}
	public boolean NoteDelete(int nid) {
		boolean f=false;
		try {
			
			String query="delete from addNotes where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, nid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}

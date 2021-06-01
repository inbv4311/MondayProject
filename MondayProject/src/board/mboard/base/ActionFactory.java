package board.mboard.base;

import board.mboard.impl.BoardActionList;
import board.mboard.impl.BoardActionUpdate;
import board.mboard.impl.BoardActionUpdateForm;
import board.mboard.impl.BoardActionView;
import board.mboard.impl.BoardActionWrite;
import board.mboard.impl.BoardActionWriteForm;
import board.mboard.impl.MenuActionDelete;
import board.mboard.impl.MenuActionList;
import board.mboard.impl.MenuActionUpdate;
import board.mboard.impl.MenuActionUpdateForm;
import board.mboard.impl.MenuActionWrite;
import board.mboard.impl.MenuActionWriteForm;

public class ActionFactory {

	public Action getAction(String command) {
		Action  action  = null;
		
		System.out.println( "getAction:" + command  );
		// cmd=MENUWRITEFORMM
		switch(command) {
		case "MENULIST":
			action = new MenuActionList();
			break;
		case "MENUWRITEFORM":
			action = new MenuActionWriteForm();
			break;
		case "MENUWRITE":			
			action = new MenuActionWrite();
			break;
		case "MENUUPDATEFORM":
			action = new MenuActionUpdateForm();
			break;
		case "MENUUPDATE":
			action = new MenuActionUpdate();
			break;
		case "MENUDELETE":
			action = new MenuActionDelete();
			break;
			
	// 게시판		
		case "LIST":		
			action = new BoardActionList();
			break;	
		case "WRITEFORM": //  새글쓰기 입력화면 		
			action = new BoardActionWriteForm();
			break;
		case "WRITE":	  // 글저장	
			action = new BoardActionWrite();
			break;

		case "VIEW":	  // 내용 보기	
			action = new BoardActionView();
			break;
			
		case "UPDATEFORM":		
			action = new BoardActionUpdateForm();
			break;
		case "UPDATE":		
			action = new BoardActionUpdate();
			break;
		}		
		
		return  action;
	}
	
}










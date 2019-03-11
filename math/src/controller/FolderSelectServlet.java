package controller;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Folder;

/**
 * Servlet implementation class FolderSelectServlet
 */
@WebServlet("/fselect")
public class FolderSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FolderSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입시 사용자아이디 중복확인 처리용 컨트롤러
				//1. 전송 온 값에 한글이 있으면 인코딩처리함
				//request.setCharacterEncoding("utf-8");
				
				//2. 전송 온 값 꺼내서 변수 또는 도메인객체에 저장하기
				String f1 = request.getParameter("f1");
				//System.out.println("전송온 값 : " + f1);
				
				//3. 서비스모델로 값 또는 객체 전달하고, 결과받기
				
				//4. 받은 결과를 가지고 요청자에서 응답처리하기 
				Folder fo = new Folder();
				fo.setF1(f1);
				
				RequestDispatcher view = request.getRequestDispatcher("views/second.jsp");
				request.setAttribute("f1", fo.getF1());
				view.forward(request, response);
				
				//ajax 통신에 대한 응답 처리는 출력 스트림으로 값을 전송한다
				PrintWriter out = response.getWriter();
				out.append(f1);
				out.flush();
				out.close();
				

			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Folder;

/**
 * Servlet implementation class ImageSelectServlet
 */
@WebServlet("/iselect")
public class ImageSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String f3 = request.getParameter("f3");
		
		Folder fo = new Folder();
		fo.setF3(f3);
		
		//System.out.println(fo.getF3());
		RequestDispatcher view = request.getRequestDispatcher("views/test.jsp");
		request.setAttribute("f3", fo.getF3());
		view.forward(request, response);
		
		//ajax 통신에 대한 응답 처리는 출력 스트림으로 값을 전송한다
		PrintWriter out = response.getWriter();
		out.append(f3);
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

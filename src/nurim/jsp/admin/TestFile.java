package nurim.jsp.admin;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import nurim.jsp.admin.service.ProductAdmin;
import nurim.jsp.service.ProductService;
import nurim.jsp.admin.service.impl.ProductAdminImpl;
import nurim.jsp.service.impl.ProductServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.model.ProCategory;
import nurim.jsp.model.Product;

@WebServlet("/api/testest.do")
public class TestFile extends BaseController {
	private static final long serialVersionUID = 1L;
	// json파일 절대주소
	private static final String filePath = "/home/hosting_users/qkrtkdgns2/upload/pro_list.json";
	Logger logger;
	SqlSession sqlSession;
	ProductService productService;
	ProductAdmin productAdmin;
	@Override
	@SuppressWarnings("unchecked")
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		productService = new ProductServiceImpl(sqlSession, logger);
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		
		try {

			// read the json file

			FileReader reader = new FileReader(filePath);

			JSONParser jsonParser = new JSONParser();

			JSONArray lang = (JSONArray) jsonParser.parse(reader);
			List<Product> product = new ArrayList<Product>();
			for (int i = 0; i < lang.size(); i++) {
				JSONObject temp = (JSONObject) lang.get(i);
				//JSON에서 데이터 추출 
				String amount =  String.valueOf(temp.get("amount"));
				String proImg = String.valueOf(temp.get("proImg"));
				String proName = String.valueOf(temp.get("proName"));
				String proPrice =  String.valueOf(temp.get("proPrice"));
				int proHit = Integer.parseInt(String.valueOf(temp.get("proHit")));
				String regDate = String.valueOf(temp.get("regDate"));
				String editDate = String.valueOf(temp.get("editDate"));
				String provider = String.valueOf(temp.get("provider"));
				String content = String.valueOf(temp.get("content"));
				int category = Integer.parseInt(String.valueOf(temp.get("category")));
				
				// 추출한 값을 객체에 셋팅
				Product temple = new Product();
				temple.setAmount(amount);
				temple.setProImg(proImg);
				temple.setProName(proName);
				temple.setProPrice(proPrice);
				temple.setProHit(proHit);
				temple.setRegDate(regDate);
				temple.setEditDate(editDate);
				temple.setProvider(provider);
				temple.setContent(content);
				logger.debug("temple >> " + temple);
				
				//데이터 등록
				productAdmin.insertProduct(temple);
				ProCategory proCategory = new ProCategory();
				int categoryid = category;
				proCategory.setCategoryId(categoryid);
				proCategory.setProductId(temple.getId());
				productAdmin.insertProCategory(proCategory);
				
				product.add(temple);
			}
			logger.debug("product >> "+ product);

		} catch (FileNotFoundException ex) {

			ex.printStackTrace();

		} catch (IOException ex) {

			ex.printStackTrace();

		} catch (ParseException ex) {

			ex.printStackTrace();

		} catch (NullPointerException ex) {

			ex.printStackTrace();

		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.close();
		}

		return null;
	}

}

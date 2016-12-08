package nurim.jsp.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.ProductAdmin;
import nurim.jsp.model.Category;
import nurim.jsp.model.ProCategory;
import nurim.jsp.model.Product;

public class ProductAdminImpl implements ProductAdmin {
	SqlSession sqlSession;
	Logger logger;

	public ProductAdminImpl(SqlSession sqlSession, Logger logger) {
		super();
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertProduct(Product product) throws Exception {
		try {
			int result = sqlSession.insert("ProductMapper.insertProduct", product);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 상품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<Product> selectProductList(Product product) throws Exception {
		List<Product> result = null;
		try {
			result = sqlSession.selectList("ProductMapper.selectProductList", product);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 상품 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectProductCount(Product product) throws Exception {
		int result = 0;

		try {
			// 상품 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ProductMapper.selectProductCount", product);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 수 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void insertProCategory(ProCategory proCategory) throws Exception {
		try {
			int result = sqlSession.insert("ProCategoryMapper.insertProCategory", proCategory);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("등록된 카테고리가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("카테고리 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<Category> selectCategoryList(Category category) throws Exception {
		List<Category> result = null;
		try {
			
			result = sqlSession.selectList("CategoryMapper.selectCategoryList", category);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 카테고리 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("카테고리 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<ProCategory> selectProCategoryList(ProCategory proCategory) throws Exception {
		List<ProCategory> result = null;
		try {
			
			result = sqlSession.selectList("ProCategoryMapper.selectProCategoryList", proCategory);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 카테고리 검색 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("카테고리 검색 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void deleteProduct(Product product) throws Exception {
		try{
			int result = sqlSession.delete("ProductMapper.deleteProduct", product ); 
			if(result  == 0) {
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 상품에 대한 요청입니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public void deleteProCategory(ProCategory proCategory) throws Exception {
		try{
			int result = sqlSession.delete("ProCategoryMapper.deleteProCategory", proCategory ); 
			if(result  == 0) {
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 카테고리에 대한 요청입니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 카테고리 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	
	@Override
	public Product selectProduct(Product product) throws Exception {
		Product result = null;
		
		try{
			result = sqlSession.selectOne("ProductMapper.selectProduct", product);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 상품에 대한 요청입니다.1");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 검색에 실패했습니다.");
		}
		return result;
	}

}

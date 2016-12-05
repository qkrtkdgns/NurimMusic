package nurim.jsp.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.ProductService;
import nurim.jsp.model.Product;

public class ProductServiceImpl implements ProductService{
	
	Logger logger;
	SqlSession sqlSession;

	public ProductServiceImpl( SqlSession sqlSession,Logger logger) {
		super();
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectProductCategoryCount(Product product) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("ProductMapper.selectProductCategoryCount",product);
			
			logger.debug("selectProductCount >> " + result);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Product> selectProductList(Product product) throws Exception {
		List<Product> result = null;
		
		try{
			result = sqlSession.selectList("ProductMapper.selectProductList",product);
			if(result == null){
				throw new NullPointerException();
			}
			logger.debug("selectProductList >> " + result);
		}catch (NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}

	@Override
	public void insertProductItem(Product product) throws Exception {
		try{
			int result = sqlSession.insert("ProductMapper.insertProductItem",product);
			if(result == 0){
				throw new NullPointerException();
			}
			logger.debug("insertProductItem >> " + result);
		}catch (NullPointerException e){
			sqlSession.rollback();
			logger.debug("저장할 데이터가 잘못되었습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		
		
	}

	@Override
	public List<Product> selectProductCategoryList(Product product) throws Exception {
		List<Product> result = null;
		
		try{
			result = sqlSession.selectList("ProductMapper.selectProductCategoryList",product);
			if(result == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}

}
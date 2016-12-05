package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Basket;
import nurim.jsp.service.BasketService;

public class BasketServiceImpl implements BasketService {
	SqlSession sqlSession;
	Logger logger;

	public BasketServiceImpl(SqlSession sqlSession, Logger logger) {
		super();
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public List<Basket> selectList(Basket bas) throws Exception {
		List<Basket> result = null;
		
		try{
			result = sqlSession.selectList("BasketMapper.selectList",bas);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("장바구니 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteitem(Basket bas) throws Exception {
		
		try{
			int result = sqlSession.delete("BasketMapper.deleteitem",bas);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("상품 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void updateItem(Basket basket) throws Exception {
		try{
			int result = sqlSession.update("BasketMapper.updateItem",basket);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("상품 수정에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public Basket selectItem(Basket basket) throws Exception {
		Basket result = null;
		
		try{
			result = sqlSession.selectOne("BasketMapper.selectItem",basket);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("장바구니 조회에 실패했습니다.");
		}
		
		return result;
	}

}

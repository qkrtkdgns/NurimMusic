package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Basket;
import nurim.jsp.model.Product;
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

	@Override
	public void compareItem(Basket basket) throws Exception {
		Basket res = null;
		try{
			res = sqlSession.selectOne("BasketMapper.compareItem",basket);
			int result = res.getAmount();
			logger.debug("ProName >> " + res.getProName());
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception(res.getProName()+"상품의 재고가 충분하지 않습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("재고 확인에 실패했습니다.");
		}
	}

	@Override
	public Basket selectProductBasketItem(Basket basket) throws Exception {
Basket result = null;
		
		try{
			result = sqlSession.selectOne("BasketMapper.selectProductBasketItem",basket);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("등록할 상품이 존재하지 않습니다.");
		}catch(Exception e){
		
			logger.debug(e.getLocalizedMessage());
			throw new Exception("상품추가에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteBasket(Basket basket) throws Exception {
		
		try{
			int result = sqlSession.delete("BasketMapper.deleteBasket",basket);
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("장바구니 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void compareItem2(Basket basket) throws Exception {
		Basket res = null;
		try{
			res = sqlSession.selectOne("BasketMapper.compareItem2",basket);
			int result = res.getAmount();
			logger.debug("ProName >> " + res.getProName());
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception(res.getProName()+"상품의 재고가 충분하지 않습니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("재고 확인에 실패했습니다.");
		}
	}
	@Override
	public Basket insertItem(Basket basket) throws Exception {
		try {
			int result = sqlSession.insert("BasketMapper.insertItem", basket);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("장바구니에 저장된 상품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 장바구니 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		return null;
	}

	@Override
	public Basket insertItemList(Basket basket) throws Exception {
		try {
			int result = sqlSession.insert("BasketMapper.insertItemList", basket);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("장바구니에 저장된 상품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 장바구니 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		return null;
	}

	@Override
	public Basket insertItem2(Basket basket) throws Exception {
		try {
			int result = sqlSession.insert("BasketMapper.insertItem2", basket);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("장바구니에 저장된 상품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("상품 장바구니 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		return null;
	}

}

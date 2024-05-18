package com.neo.byez.dao.item;

import com.neo.byez.domain.item.Category;
import com.neo.byez.domain.item.ItemDetailPageDto;
import com.neo.byez.domain.item.ItemDto;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao {

    @Autowired
    SqlSession session;

    private static final String namespace = "com.neo.byez.dao.item.ItemDao.";

    // 카운트
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }

    public ItemDto select(String num) throws Exception {
        return session.selectOne(namespace +"select", num);
    }

    // 모두 조회
    public List<ItemDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    public List<ItemDto> selectByCategory(Category category) throws Exception {
        return session.selectList(namespace + "selectByCategory", category);
    }

    public List<ItemDto> selectDiscountItem(Category category) throws Exception {
        return session.selectList(namespace + "selectDiscountItem", category);
    }

    public ItemDetailPageDto selectDetailItem(String num) throws Exception {
        return session.selectOne(namespace + "selectDetailItem", num);
    }


    // 등록
    public int insert(ItemDto dto) throws Exception {
        return session.insert(namespace +"insert", dto);
    }

    // 수정
    public int update(ItemDto dto) throws Exception {
        return session.update(namespace +"update", dto);
    }

    // 삭제
    public int delete(ItemDto dto) throws Exception {
        return session.delete(namespace + "delete", dto);
    }

    // 모두 삭제
    public int deleteAll() throws Exception {
        return session.delete(namespace +"deleteAll");
    }

    // 특정 카테고리 상품 조회
    public List<ItemDto> selectItemType(Category category) {
        return session.selectList(namespace+"selectItemType", category);
    }

    // 상품 상태


    //    메인페이지 여성 top 8개 상품 띄우기
    public List<ItemDto> selectWTop8(ItemDto dto) throws Exception {
        return session.selectList(namespace+"selectWTop8", dto);
    }

    //    메인페이지 남성 top 8개 상품 띄우기
    public List<ItemDto> selectMTop8(ItemDto dto) throws Exception {
        return session.selectList(namespace+"selectMTop8", dto);
    }

    //    메인페이지 혼성 top 8개 상품 띄우기
    public List<ItemDto> selectUTop8(ItemDto dto) throws Exception {
        return session.selectList(namespace+"selectUTop8", dto);
    }

}

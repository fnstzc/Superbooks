package com.zc.superbooks.manager;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.zc.superbooks.dao.DistributionDao;
import com.zc.superbooks.entity.Distribution;
import com.zc.superbooks.message.MessageCode;
import com.zc.superbooks.util.MybatisUtil;

@Service
public class DistributionManager {
	public List<Distribution> getDistributionList() {
		SqlSession session = MybatisUtil.getSqlSession();
		DistributionDao distributionDao = session.getMapper(DistributionDao.class);
		List<Distribution> distributionList = distributionDao.getAllDistribution();
		session.close();
		if (distributionList.isEmpty() || distributionList == null) {
			return new ArrayList<Distribution>();
		}
		
		return distributionList;
	}
	
	public String addDistribution(String name, String total, String crash,String alipay,
			String card, String qqWallet, String weixinWallet,String financialProducts,String date) {
		int addResultNum = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		DistributionDao distributionDao = session.getMapper(DistributionDao.class);
		addResultNum = distributionDao.addDistribution(name, total, crash, alipay, card, qqWallet, weixinWallet, financialProducts, date);
		session.commit();
		session.close();
		
		if (addResultNum != 0) {
			return MessageCode.ADD_OK;
		} else {
			return MessageCode.ADD_FAILED;
		}
	}
	
	public Distribution findDistribution(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		DistributionDao distributionDao = session.getMapper(DistributionDao.class);
		Distribution distribution = distributionDao.findDistributionByName(name);
		if (distribution == null) {
			return new Distribution();
		}
		
		return distribution;
	}
}
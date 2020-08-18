package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.mapper.Sample1Mapper;
import org.zerock.mapper.Sample2Mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {

	@Setter(onMethod_ = {@Autowired})
	private Sample1Mapper sample1Mapper;
	
	@Autowired
	private Sample2Mapper sample2Mapper;
	
	@Transactional
	@Override
	public void addData(String value) {

		log.info("Sample1Mapper.....................");
		sample1Mapper.insertCol1(value);
		
		log.info("Sample2Mapper.....................");
		sample2Mapper.insertCol2(value);
		
		log.info("end..............");
	}

}

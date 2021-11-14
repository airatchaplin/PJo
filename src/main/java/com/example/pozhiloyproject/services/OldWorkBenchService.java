package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.oldOrder.OldWorkBench;
import com.example.pozhiloyproject.repository.OldWorkBenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OldWorkBenchService {

    @Autowired
    OldWorkBenchRepository oldWorkBenchRepository;

    public void saveOldWorkBench(OldWorkBench oldWorkBench){
        oldWorkBenchRepository.save(oldWorkBench);
    }

    public void deleteOldWorkBench(OldWorkBench oldWorkBench){oldWorkBenchRepository.delete(oldWorkBench);}
}

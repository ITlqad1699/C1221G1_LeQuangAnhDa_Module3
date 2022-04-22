package service.impl.employee_impl;

import model.employee.Level;
import repository.iget_type_interface.ILevelRepository;
import repository.impl.employee_repository_impl.LevelRepository;
import service.iget_type.IlevelService;

import java.util.List;

public class LevelService implements IlevelService {
    ILevelRepository levelRepository = new LevelRepository();
    @Override
    public List<Level> getLevel() {
        return levelRepository.getLevel();
    }
}

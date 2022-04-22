package service.impl.employee_impl;

import model.employee.Devision;
import repository.iget_type_interface.IDevisionRepository;
import repository.impl.employee_repository_impl.DevisionRepository;
import service.iget_type.IDevisionService;

import java.util.List;

public class DevisionService implements IDevisionService {
    IDevisionRepository devisionRepository = new DevisionRepository();
    @Override
    public List<Devision> getDevision() {
        return devisionRepository.getDevision();
    }
}

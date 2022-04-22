package service.impl.employee_impl;

import model.employee.Position;
import repository.iget_type_interface.IPositionRepository;
import repository.impl.employee_repository_impl.PostionRepository;
import service.iget_type.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepository positionRepository = new PostionRepository();
    @Override
    public List<Position> getPosition() {
        return positionRepository.getPosition();
    }
}

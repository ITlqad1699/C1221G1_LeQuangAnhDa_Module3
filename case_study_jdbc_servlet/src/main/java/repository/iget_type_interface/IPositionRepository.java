package repository.iget_type_interface;

import model.employee.Position;

import java.util.List;

public interface IPositionRepository {
    List<Position> getPosition();
}

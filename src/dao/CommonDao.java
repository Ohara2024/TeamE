package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommonDao extends Dao {

    // Lấy danh sách năm nhập học duy nhất
    public List<Integer> getDistinctEntYear() throws Exception {
        List<Integer> years = new ArrayList<>();
        String sql = "SELECT DISTINCT ent_year FROM student ORDER BY ent_year DESC";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                years.add(rs.getInt("ent_year"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return years;
    }

    // Lấy danh sách lớp học
    public List<String> getClassNums() throws Exception {
        List<String> classes = new ArrayList<>();
        String sql = "SELECT DISTINCT class_num FROM class_num ORDER BY class_num";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                classes.add(rs.getString("class_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classes;
    }

    // Lấy danh sách môn học
    public List<String> getSubjects() throws Exception {
        List<String> subjects = new ArrayList<>();
        String sql = "SELECT cd FROM subject ORDER BY cd";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                subjects.add(rs.getString("cd"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }
}

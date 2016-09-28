import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  @Override
  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/recipe_box_test", null, null);
  }

  @Override
  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteRecipeQuery = "DELETE FROM recipes *;";
      String deleteCategoryQuery = "DELETE FROM categories *;";
      String deleteRTQuery = "DELETE FROM recipes_tags *;";
      con.createQuery(deleteRecipeQuery).executeUpdate();
      con.createQuery(deleteCategoryQuery).executeUpdate();
      con.createQuery(deleteRTQuery).executeUpdate();
    }
  }

}

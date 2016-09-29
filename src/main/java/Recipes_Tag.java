import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Recipes_Tag {
  private int recipes_id;
  private int categories_id;
  private int id;

  public Recipes_Tag (int recipes_id, int categories_id) {
    this.recipes_id = recipes_id;
    this.categories_id = categories_id;
  }

  public int getRecipe() {
    return recipes_id;
  }

  public int getTag() {
    return categories_id;
  }
}

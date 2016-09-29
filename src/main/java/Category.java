import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Category implements Getter {
  private String tag;
  private int id;

  public Category (String tag) {
    this.tag = tag;
  }

  public static List<Category> all() {
    String sql = "SELECT * FROM categories";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Category.class);
    }
  }

  public String getTag() {
    return tag;
  }

  public int getId() {
    return id;
  }

  public static Category find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM categories where id=:id";
      Category category = con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Category.class);
      return category;
    }
  }

  @Override
  public boolean equals(Object otherCategory) {
    if (!(otherCategory instanceof Category)) {
      return false;
    } else {
      Category newCategory = (Category) otherCategory;
      return this.getTag().equals(newCategory.getTag());
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO categories(tag) VALUES (:tag)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("tag", this.tag)
      .executeUpdate()
      .getKey();
    }
  }

  public void addRecipe(Recipes recipe) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO recipes_tags (recipes_id, categories_id) VALUES (:recipes_id, :categories_id)";
      con.createQuery(sql)
      .addParameter("recipes_id", recipe.getId())
      .addParameter("categories_id", this.id)
      .executeUpdate();
    }
  }

  public List<Recipes> getRecipe() {
    try(Connection con = DB.sql2o.open()){
      String joinQuery = "SELECT recipes_tags.* FROM recipes_tags LEFT JOIN categories ON categories.id = recipes_tags.categories_id WHERE categories_id = :id";

      System.out.println("before the first con");
      List<Recipes_Tag> recipes_tags = con.createQuery(joinQuery)
      .addParameter("id", this.getId())
      .executeAndFetch(Recipes_Tag.class);

      System.out.println("after the first con");

      List<Recipes> recipes = new ArrayList<Recipes>();

      for (Recipes_Tag recipes_tag : recipes_tags) {
        String recipesQuery = "SELECT * FROM recipes WHERE id = :recipeId";
        Recipes recipe = con.createQuery(recipesQuery)
        .addParameter("recipeId", recipes_tag.getRecipe())
        .executeAndFetchFirst(Recipes.class);
        recipes.add(recipe);
      }
      return recipes;
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM categories WHERE id=:id;";
      con.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();

      sql = "DELETE FROM recipes_tags WHERE categories_id = :categories_id";
      con.createQuery(sql)
      .addParameter("categories_id", this.id)
      .executeUpdate();
    }
  }

  public void update(String tag) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE categories SET tag = :tag WHERE id=:id";
      con.createQuery(sql)
      .addParameter("tag", tag)
      .addParameter("id", this.id)
      .executeUpdate();
    }
  }
}

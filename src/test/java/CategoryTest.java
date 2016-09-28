import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.Arrays;

public class CategoryTest {
  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void category_instantiatesCorrectly_true() {
    Category testCategory = new Category("fast");
    assertEquals(true, testCategory instanceof Category);
  }

  @Test
  public void getTag_categoryInstantiatesWithTag_fast() {
    Category testCategory = new Category("fast");
    assertEquals("fast", testCategory.getTag());
  }

 @Test
 public void all_returnsAllInstancesOfCategory_true() {
   Category firstCategory = new Category("fast");
   firstCategory.save();
   Category secondCategory = new Category("easy");
   secondCategory.save();
   assertEquals(true, Category.all().get(0).equals(firstCategory));
   assertEquals(true, Category.all().get(1).equals(secondCategory));
 }

 @Test
 public void getId_categoriesInstantiateWithAnId_1() {
   Category testCategory = new Category("fast");
   testCategory.save();
   assertTrue(testCategory.getId() > 0);
 }

 @Test
 public void find_returnsCategoryWithSameId_secondCategory() {
   Category firstCategory = new Category("fast");
   firstCategory.save();
   Category secondCategory = new Category("easy");
   secondCategory.save();
   assertEquals(Category.find(secondCategory.getId()), secondCategory);
 }

  @Test
  public void equals_returnsTrueIfNamesAretheSame() {
    Category firstCategory = new Category("fast");
    Category secondCategory = new Category("fast");
    assertTrue(firstCategory.equals(secondCategory));
  }

  @Test
  public void save_savesIntoDatabase_true() {
    Category myCategory = new Category("fast");
    myCategory.save();
    assertTrue(Category.all().get(0).equals(myCategory));
  }

  @Test
  public void save_assignsIdToObject() {
    Category myCategory = new Category("fast");
    myCategory.save();
    Category savedCategory = Category.all().get(0);
    assertEquals(myCategory.getId(), savedCategory.getId());
  }

  @Test
  public void addRecipe_addsRecipeToCategory() {
    Category testCategory = new Category("fast");
    testCategory.save();
    Recipes testRecipe = new Recipes("Chicken and Rice", "One whole chicken, 2 cups of rice, 4 cups of Water", "1. Cook Chicken in Oven 350 degrees (until white). 2. Boil rice in rice-cooker. 3. Season rice and chicken. 4. Put rice and chiken together.");
    testRecipe.save();
    testCategory.addRecipe(testRecipe);
    Recipes savedRecipe = testCategory.getRecipe().get(0);
    assertTrue(testRecipe.equals(savedRecipe));
  }

}

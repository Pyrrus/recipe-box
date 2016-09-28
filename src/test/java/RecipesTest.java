import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.Arrays;

public class RecipesTest {
  private Recipes testRecipe;
  private Recipes otherRecipe;

  @Before public void initialize() {
    testRecipe = new Recipes ("Chicken and Rice", "One whole chicken, 2 cups of rice, 4 cups of Water", "1. Cook Chicken in Oven 350 degrees (until white). 2. Boil rice in rice-cooker. 3. Season rice and chicken. 4. Put rice and chiken together.");
    otherRecipe = new Recipes ("Spaghetti", "One box of noodles, One can of tomatoes sauce, Ground beef, Italian Seasoning", "1. Boil noodles in water until adante and strain. 2. Heat tomatoe sauce in sauce pan. 3. Shape beef into meatballs and add italian seasoning. 4. Cooking meatballs in frying pan. 5. Add pasta with sauce and meatballs.");
  }

  @Rule
  public DatabaseRule database = new DatabaseRule();

    @Test
    public void category_instantiatesCorrectly_true() {
      assertEquals(true, testRecipe instanceof Recipes);
    }

    @Test
    public void getName_categoryInstantiatesWithName_ChickenAndRice() {
      assertEquals("Chicken and Rice", testRecipe.getName());
    }

   @Test
   public void all_returnsAllInstancesOfRecipes_true() {
     testRecipe.save();
     otherRecipe.save();
     assertEquals(true, Recipes.all().get(0).equals(testRecipe));
     assertEquals(true, Recipes.all().get(1).equals(otherRecipe));
   }

   @Test
   public void getId_categoriesInstantiateWithAnId_1() {
     testRecipe.save();
     assertTrue(testRecipe.getId() > 0);
   }

   @Test
   public void find_returnsRecipesWithSameId_otherRecipe() {
     testRecipe.save();
     otherRecipe.save();
     assertEquals(Recipes.find(otherRecipe.getId()), otherRecipe);
   }

    @Test
    public void equals_returnsTrueIfNamesAretheSame() {
      Recipes testRecipeOther = new Recipes("Chicken and Rice", "One whole chicken, 2 cups of rice, 4 cups of Water", "1. Cook Chicken in Oven 350 degrees (until white). 2. Boil rice in rice-cooker. 3. Season rice and chicken. 4. Put rice and chiken together.");
      Recipes otherRecipeSecond = new Recipes("Chicken and Rice", "One whole chicken, 2 cups of rice, 4 cups of Water", "1. Cook Chicken in Oven 350 degrees (until white). 2. Boil rice in rice-cooker. 3. Season rice and chicken. 4. Put rice and chiken together.");
      assertTrue(testRecipeOther.equals(otherRecipeSecond));
    }

    @Test
    public void save_savesIntoDatabase_true() {
      testRecipe.save();
      assertTrue(Recipes.all().get(0).equals(testRecipe));
    }

    @Test
    public void save_assignsIdToObject() {
      testRecipe.save();
      Recipes savedRecipes = Recipes.all().get(0);
      assertEquals(testRecipe.getId(), savedRecipes.getId());
    }

    @Test
    public void getCategories_getCategoriesFromRecipes() {
      Category testCategory = new Category("fast");
      testCategory.save();
      testRecipe.save();
      testCategory.addRecipe(testRecipe);
      Category savedCategory = testRecipe.getCategories().get(0);
      assertTrue(testCategory.equals(savedCategory));
    }


}

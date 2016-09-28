import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.Arrays;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("categories", Category.all());
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/categories/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("categories", Category.all());
      model.put("template", "templates/categories-edit.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/categories/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/new-category.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/categories/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Category category = Category.find(Integer.parseInt(request.params(":id")));
      model.put("category", category);
      model.put("template", "templates/category.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("recipe/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("categories", Category.all());
      model.put("template", "templates/recipe-new.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/recipe", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("recipes", Recipes.all());
      model.put("template", "templates/list-recipes.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/recipe/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Recipes repcipes = Recipes.find(Integer.parseInt(request.params(":id")));
      model.put("recipes", repcipes);
      model.put("categories", Category.all());
      model.put("template", "templates/recipe-edit.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/recipe/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String ingredients = request.queryParams("ingredients");
      String instructions = request.queryParams("instructions");
      Recipes recipes = new Recipes (name, ingredients, instructions);
      recipes.save();
      String[] tags = request.queryParamsValues("tags");
      for (int i = 0; i < tags.length; i++) {
        Category foundCategory = Category.find(Integer.parseInt(tags[i]));
        foundCategory.addRecipe(recipes);
      }
      response.redirect("/");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/addCategories", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String tag = request.queryParams("tag");
      Category saveTag = new Category(tag);
      saveTag.save();
      response.redirect("/recipe/new");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/recipe/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Recipes repcipes = Recipes.find(Integer.parseInt(request.params(":id")));
      model.put("recipes", repcipes);
      model.put("template", "templates/recipe.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/category/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Category category = Category.find(Integer.parseInt(request.params(":id")));
      String tag = request.queryParams("tag");
      category.update(tag);
      response.redirect("/categories/edit");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/category/:id/remove", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Category category = Category.find(Integer.parseInt(request.params(":id")));
      category.delete();
      response.redirect("/categories/edit");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/recipe/:id/remove", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Recipes recipe = Recipes.find(Integer.parseInt(request.params(":id")));
      recipe.delete();
      response.redirect("/recipe");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/recipe/:id/edit", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String ingredients = request.queryParams("ingredients");
      String instructions = request.queryParams("instructions");
      Recipes recipe = Recipes.find(Integer.parseInt(request.params(":id")));
      recipe.update(name, ingredients, instructions);
      String[] tags = request.queryParamsValues("tags");
      for (int i = 0; i < tags.length; i++) {
        Category foundCategory = Category.find(Integer.parseInt(tags[i]));
        foundCategory.addRecipe(recipe);
      }
      response.redirect("/recipe");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

  }
}

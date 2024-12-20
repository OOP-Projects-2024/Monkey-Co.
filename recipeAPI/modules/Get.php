<?php

include_once "Common.php";
class Get extends Common{
    protected $pdo;

    public function __construct(\PDO $pdo){
        $this->pdo = $pdo;
    }
    public function getLogs($date){
        $filename = "./logs/" . $date . ".log";
    
        $logs = array();
        try{
            $file = new SplFileObject($filename);
            while(!$file->eof()){
                array_push($logs, $file->fgets());
            }
            $remarks = "success";
            $message = "Successfully retrieved logs.";
        }
        catch(Exception $e){
            $remarks = "failed";
            $message = $e->getMessage();
        }
        

        return $this->generateResponse(array("logs"=>$logs), $remarks, $message, 200);
    }

    
    
    public function getRecipes($id){
        
        $condition = "isdeleted = 0";
        if($id != null){
            $condition .= " AND recipe_id=" . $id; 
        }

        $condition .= " ORDER BY favorite DESC";

        $result = $this->getDataByTable('recipe_tbl', $condition, $this->pdo);
        if($result['code'] == 200){
            return $this->generateResponse($result['data'], "success", "Successfully retrieved Recipes.", $result['code']);
        }
        return $this->generateResponse(null, "failed", $result['errmsg'], $result['code']);
    }
    
    public function getIngredients($id){
        $condition = "isdeleted = 0";
        if($id != null){
            $condition .= " AND ingredient_id=" . $id; 
        }

        $result = $this->getDataByTable('Ingredients_tbl', $condition, $this->pdo);

        if($result['code'] == 200){
            return $this->generateResponse($result['data'], "success", "Successfully retrieved Ingredients.", $result['code']);
        }
        return $this->generateResponse(null, "failed", $result['errmsg'], $result['code']);
    }
    public function getFavorite($id){
        $condition = "isdeleted = 0 AND favorite = 1";

        if($id != null){
            $condition .= " AND recipe_id=" . $id; 
        }

        $result = $this->getDataByTable('recipe_tbl', $condition, $this->pdo);

        if($result['code'] == 200){
            return $this->generateResponse($result['data'], "success", "Successfully retrieved Favorites.", $result['code']);
        }
        return $this->generateResponse(null, "failed", $result['errmsg'], $result['code']);
    }
    
}
?>
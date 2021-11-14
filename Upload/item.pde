class Item{
    String type;
    public Item(String passedtype){
       type = passedtype;
    }
    
    void use(String type){
      if(type == "Net")
        useNet();
    }
    
    void useNet(){
      for (int i = 0; i <lvl1occ; i++) {
        lvl1entities[i].checkEntityCollision("Net");
      }
      
      
      //ADD IN DIRECTION VARIABLE
      //if(Facing left){
 //<>//
      //else if (facing right){
        
      //}
    }
}

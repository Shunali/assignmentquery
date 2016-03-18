public with sharing class sosl {

public void allObject_sosl
 {
 List<List<SObject>> searchList = [FIND 'word' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
  system.debug(searchList);
 }
}
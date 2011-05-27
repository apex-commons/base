/* ============================================================
 * This code is part of the "apex-lang" open source project avaiable at:
 * 
 *      http://code.google.com/p/apex-lang/
 *
 * This code is licensed under the Apache License, Version 2.0.  You may obtain a 
 * copy of the License at:
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * ============================================================
 */
@IsTest
private class ArrayUtilsTest {

    private static testmethod void testObjectToString(){ 
        //test: global static List<String> objectToString(List<Object> objectList){ 
        assertObjectToString(null, null);
        assertObjectToString(new List<Object>{}, new List<String>{});
        final String str1 = 'xyz';
        final String str2 = 'abc';
        assertObjectToString(new List<Object>{str1}, new List<String>{str1});
        assertObjectToString(new List<Object>{str1,str2}, new List<String>{str1,str2});
    }
    
    private static void assertObjectToString(List<Object> objectList, List<String> expected){
    	ArrayUtils.assertArraysAreEqual(expected, ArrayUtils.objectToString(objectList));
    }

    private static testmethod void testLowerCase(){
        //test:  global static List<String> lowerCase(List<String> strs)
        ArrayUtils.assertArraysAreEqual(null,ArrayUtils.lowerCase(null)); 
        ArrayUtils.assertArraysAreEqual(new String[]{null},ArrayUtils.lowerCase(new String[]{null})); 
        ArrayUtils.assertArraysAreEqual(new String[]{' '},ArrayUtils.lowerCase(new String[]{' '})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'abc','xyz'},ArrayUtils.lowerCase(new String[]{'abc','xyz'})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'abc','xyz'},ArrayUtils.lowerCase(new String[]{'Abc','xYz'})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'abc','xyz'},ArrayUtils.lowerCase(new String[]{'ABC','XYZ'})); 
    }

    private static testmethod void testUpperCase(){
        //test:  global static List<String> upperCase(List<String> strs)
        ArrayUtils.assertArraysAreEqual(null,ArrayUtils.lowerCase(null)); 
        ArrayUtils.assertArraysAreEqual(new String[]{null},ArrayUtils.upperCase(new String[]{null})); 
        ArrayUtils.assertArraysAreEqual(new String[]{' '},ArrayUtils.upperCase(new String[]{' '})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'ABC','XYZ'},ArrayUtils.upperCase(new String[]{'abc','xyz'})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'ABC','XYZ'},ArrayUtils.upperCase(new String[]{'Abc','xYz'})); 
        ArrayUtils.assertArraysAreEqual(new String[]{'ABC','XYZ'},ArrayUtils.upperCase(new String[]{'ABC','XYZ'})); 
    }
    
    private static testmethod void testTrim(){
        //test:  global static List<String> trim(List<String> strs)
        ArrayUtils.assertArraysAreEqual(null,ArrayUtils.trim(null)); 
        ArrayUtils.assertArraysAreEqual(new String[]{null},ArrayUtils.trim(new String[]{null})); 
        ArrayUtils.assertArraysAreEqual(new String[]{''},ArrayUtils.trim(new String[]{' \n\t '})); 
    }

    private static testmethod void testReverseObject(){
        //test: global static Object[] reverse(Object[] anArray) 
        Object[] nullArray = null;
        ArrayUtils.assertArraysAreEqual(null,ArrayUtils.reverse(nullArray)); 
        ArrayUtils.assertArraysAreEqual(new String[]{},ArrayUtils.reverse(new String[]{}));
        ArrayUtils.assertArraysAreEqual(new String[]{'a'},ArrayUtils.reverse(new String[]{'a'}));
        ArrayUtils.assertArraysAreEqual(new String[]{'ab', 'c'},ArrayUtils.reverse(new String[]{'c','ab'}));
        ArrayUtils.assertArraysAreEqual(new String[]{'a', 'b', 'c'},ArrayUtils.reverse(new String[]{'c','b','a'}));
    }

    private static testmethod void testReverseSObject(){
        //test: global static SObject[] reverse(SObject[] anArray) 
        SObject[] nullArray = null;
        Foo__c x = new Foo__c(name='x');
        Foo__c y = new Foo__c(name='y');
        Foo__c z = new Foo__c(name='z');
        ArrayUtils.assertArraysAreEqual(null,ArrayUtils.reverse(nullArray)); 
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{},ArrayUtils.reverse(new Foo__c[]{}));
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{x},ArrayUtils.reverse(new Foo__c[]{x}));
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{x,y},ArrayUtils.reverse(new Foo__c[]{y, x}));
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{x,y,z},ArrayUtils.reverse(new Foo__c[]{z,y,x}));
    }

    private static testmethod void testIsEmpty(){
        //test: global static Boolean isEmpty(Object[] objectArray){
        String[] aNull = null;
        Foo__c[] aNull2 = null;
        ArrayUtils[] aNull3 = null;
        System.assertEquals(true,    ArrayUtils.isEmpty(aNull)); 
        System.assertEquals(true,    ArrayUtils.isEmpty(new String[]{})); 
        System.assertEquals(false,    ArrayUtils.isEmpty(new String[]{'a'})); 
        System.assertEquals(false,    ArrayUtils.isEmpty(new String[]{'a','b'})); 
        System.assertEquals(true,    ArrayUtils.isEmpty(new Integer[]{})); 
        System.assertEquals(false,    ArrayUtils.isEmpty(new Integer[]{1})); 
        System.assertEquals(false,    ArrayUtils.isEmpty(new Integer[]{1,2})); 
        System.assertEquals(true,    ArrayUtils.isEmpty(aNull2)); 
        System.assertEquals(true,    ArrayUtils.isEmpty(new Foo__c[]{}));  
        System.assertEquals(false,    ArrayUtils.isEmpty(new Foo__c[]{new Foo__c(name='test')}));  
        System.assertEquals(true,    ArrayUtils.isEmpty(aNull3)); 
        System.assertEquals(true,    ArrayUtils.isEmpty(new ArrayUtils[]{}));  
        System.assertEquals(false,    ArrayUtils.isEmpty(new ArrayUtils[]{new ArrayUtils()}));  
    }
    
    private static testmethod void testIsNotEmpty(){
        //test: global static Boolean isNotEmpty(Object[] objectArray){
        String[] aNull = null;
        Foo__c[] aNull2 = null;
        ArrayUtils[] aNull3 = null;
        System.assertEquals(false,    ArrayUtils.isNotEmpty(aNull)); 
        System.assertEquals(false,    ArrayUtils.isNotEmpty(new String[]{})); 
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new String[]{'a'})); 
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new String[]{'a','b'})); 
        System.assertEquals(false,    ArrayUtils.isNotEmpty(new Integer[]{})); 
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new Integer[]{1})); 
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new Integer[]{1,2})); 
        System.assertEquals(false,    ArrayUtils.isNotEmpty(aNull2)); 
        System.assertEquals(false,    ArrayUtils.isNotEmpty(new Foo__c[]{}));  
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new Foo__c[]{new Foo__c(name='test')}));  
        System.assertEquals(false,    ArrayUtils.isNotEmpty(aNull3)); 
        System.assertEquals(false,    ArrayUtils.isNotEmpty(new ArrayUtils[]{}));  
        System.assertEquals(true,    ArrayUtils.isNotEmpty(new ArrayUtils[]{new ArrayUtils()}));  
    }
    
    private static testmethod void testPluck(){
        //test: global static Object[] pluck(SObject[] objectArray, String fieldName)
        assertPluck(null,'name',new Object[]{});
        assertPluck(new Foo__c[]{new Foo__c(name='abc123'),new Foo__c(name='xyz456')},null,new Object[]{});
        assertPluck(new Foo__c[]{new Foo__c(name='abc123'),new Foo__c(name='xyz456')},'name',
            new String[]{'abc123','xyz456'});
    }    
    
    private static void assertPluck(SObject[] objectArray, String fieldName, Object[] expected){
        Object[] actual = ArrayUtils.pluck(objectArray, fieldName);
        ArrayUtils.assertArraysAreEqual(expected, actual);    
    }

    private static testmethod void testMergeObjectArrays(){
        //test: global static Object[] mergex(Object[] array1, Object[] array2)
        Object[] nullArray = null;
        System.assertEquals(null,ArrayUtils.mergex(nullArray,nullArray));
        ArrayUtils.assertArraysAreEqual(new Object[]{},ArrayUtils.mergex(new Object[]{},nullArray));
        ArrayUtils.assertArraysAreEqual(new Object[]{},ArrayUtils.mergex(nullArray,new Object[]{}));
        Object x = 'x';
        Object y = 'y';
        Object z = 'z';
        Object ten = 10;
        ArrayUtils.assertArraysAreEqual(new Object[]{x,y,z,ten},ArrayUtils.mergex(new Object[]{x,y},new Object[]{z,ten}));
    }    
    
    private static testmethod void testMergeSObjectArrays(){
        //test: global static SObject[] mergex(SObject[] array1, SObject[] array2)
        SObject[] nullArray = null;
        System.assertEquals(null,ArrayUtils.mergex(nullArray,nullArray));
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{},ArrayUtils.mergex(new Foo__c[]{},nullArray));
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{},ArrayUtils.mergex(new Foo__c[]{},new Foo__c[]{}));
        Foo__c x = new Foo__c(name='x');
        Foo__c y = new Foo__c(name='y');
        Foo__c z = new Foo__c(name='z');
        Foo__c ten = new Foo__c(name='10');
        ArrayUtils.assertArraysAreEqual(new Foo__c[]{x,y,z,ten},ArrayUtils.mergex(new Foo__c[]{x,y},new Foo__c[]{z,ten}));
    }    
    
    private static testmethod void testQSortForceDotComPrimitives(){
        List<Double> listToSort = new Double[]{4,1.22,-5.4,1.22,3.2};
        ArrayUtils.qsort(listToSort);
        System.assertNotEquals(null, listToSort);
        System.assertEquals(5, listToSort.size());

        System.assertEquals(-5.4,     listToSort[0]);
        System.assertEquals(1.22,     listToSort[1]);
        System.assertEquals(1.22,    listToSort[2]);
        System.assertEquals(3.2,     listToSort[3]);
        System.assertEquals(4,         listToSort[4]);

        ArrayUtils.qsort(listToSort, false);
        System.assertNotEquals(null, listToSort);
        System.assertEquals(5, listToSort.size());

        System.assertEquals(4,         listToSort[0]);
        System.assertEquals(3.2,     listToSort[1]);
        System.assertEquals(1.22,     listToSort[2]);
        System.assertEquals(1.22,    listToSort[3]);
        System.assertEquals(-5.4,     listToSort[4]);
    }  
    
    private static testmethod void testToString(){
        List<Object> aList = null;
        ArrayUtils.toString(aList);
        aList = new ArrayUtils[]{};
        ArrayUtils.toString(aList);
        aList = new ArrayUtils[]{new ArrayUtils(),new ArrayUtils()};
        ArrayUtils.toString(aList);
    }

    private static testmethod void testMergeForceDotComPrimitives(){
        List<Object> l1 = new List<Object>();
        for(Integer i = 0; i < ArrayUtils.MAX_NUMBER_OF_ELEMENTS_IN_LIST; i++){
            l1.add(i);
        }
        Boolean exceptionThrown = false;
        try{
            ArrayUtils.merg(l1, new Integer[]{1});
        }catch(IllegalArgumentException e){
            exceptionThrown = true;
        }
        System.assert(exceptionThrown);

        Double[] d1 = new Double[]{1,2,3};
        Double[] d2 = new Double[]{4,5,6};
        List<Object> merged = ArrayUtils.merg(d1, d2);
        System.assertNotEquals(null,merged);
        System.assertEquals(6,merged.size());
        System.assertEquals(1,merged.get(0));
        System.assertEquals(4,merged.get(3));
    }
    
    private static testmethod void testSubsetCustomClasses(){
    	final List<Object> numbers = new List<Object>{1,2,3};
        final List<Object> actual = ArrayUtils.subset(numbers, 2);
        System.assertNotEquals(null,actual);
        System.assertEquals(2,actual.size());
        System.assertEquals(numbers.get(0),actual.get(0));
        System.assertEquals(numbers.get(1),actual.get(1));
        
    }

    private static testmethod void testMergeCustomClasses(){
        List<Object> numbers = new List<Object>();
        for(Integer i = 0; i < ArrayUtils.MAX_NUMBER_OF_ELEMENTS_IN_LIST; i++){
            numbers.add(i);
        }
        Boolean exceptionThrown = false;
        try{
            ArrayUtils.merg(numbers, new Object[]{4});
        }catch(IllegalArgumentException e){
            exceptionThrown = true;
        }
        System.assert(exceptionThrown);

        final List<Object> actual = ArrayUtils.merg(new List<Object>{1,2}, new List<Object>{3,4});
        System.assertNotEquals(null,actual);
        System.assertEquals(4,actual.size());
        System.assertEquals(1,actual.get(0));
        System.assertEquals(2,actual.get(1));
        System.assertEquals(3,actual.get(2));
        System.assertEquals(4,actual.get(3));
    }
    
    private static testmethod void testSubsetSObjects(){
        SObject[] sobjs = new Foo__c[]{
            new Foo__c(name='1'),
            new Foo__c(name='2'),
            new Foo__c(name='3')};
        List<SObject> returned = ArrayUtils.subset(sobjs, 2);
        System.assertNotEquals(null,returned);
        System.assertEquals(2,returned.size());
        System.assertEquals('1',((Foo__c)returned.get(0)).name);
        System.assertEquals('2',((Foo__c)returned.get(1)).name);
    }

    private static testmethod void testMergeSObjects(){
        List<SObject> l1 = new List<Foo__c>();
        for(Integer i = 0; i < ArrayUtils.MAX_NUMBER_OF_ELEMENTS_IN_LIST; i++){
            l1.add(new Foo__c());
        }
        Boolean exceptionThrown = false;
        try{
            ArrayUtils.merg(l1, new Foo__c[]{new Foo__c()});
        }catch(IllegalArgumentException e){
            exceptionThrown = true;
        }
        System.assert(exceptionThrown);
        l1 = null;
        List<SObject> merged = ArrayUtils.merg(l1,l1);
        System.assertEquals(null,merged);
        
        Foo__c[] c1 = new Foo__c[]{new Foo__c(name='1'),new Foo__c(name='2')};
        merged = ArrayUtils.merg(l1,c1);
        Foo__c[] c2 = new Foo__c[]{new Foo__c(name='3'),new Foo__c(name='4')};
        merged = ArrayUtils.merg(c1, c2);
        System.assertNotEquals(null,merged);
        System.assertEquals(4,merged.size());
        System.assertEquals('1',((Foo__c)merged.get(0)).name);
        System.assertEquals('2',((Foo__c)merged.get(1)).name);
        System.assertEquals('3',((Foo__c)merged.get(2)).name);
        System.assertEquals('4',((Foo__c)merged.get(3)).name);
    }
    
    private static testmethod void testSubsetForceDotComPrimitives(){
        Double[] prim = new Double[]{1,2,3};
        List<Object> returned = ArrayUtils.subset(prim, 3);
        System.assertNotEquals(null,returned);
        System.assertEquals(3,returned.size());
        System.assertEquals(1,returned.get(0));
        System.assertEquals(2,returned.get(1));
        System.assertEquals(3,returned.get(2));

        returned = ArrayUtils.subset(prim, 2);
        System.assertNotEquals(null,returned);
        System.assertEquals(2,returned.size());
        System.assertEquals(1,returned.get(0));
        System.assertEquals(2,returned.get(1));

        returned = ArrayUtils.subset(prim, 1);
        System.assertNotEquals(null,returned);
        System.assertEquals(1,returned.size());
        System.assertEquals(1,returned.get(0));

        returned = ArrayUtils.subset(prim,1,3);
        System.assertNotEquals(null,returned);
        System.assertEquals(2,returned.size());
        System.assertEquals(2,returned.get(0));
        System.assertEquals(3,returned.get(1));

        returned = ArrayUtils.subset(prim,-1,2);
        System.assertNotEquals(null,returned);
        System.assertEquals(0,returned.size());

        returned = ArrayUtils.subset(prim,10,2);
        System.assertNotEquals(null,returned);
        System.assertEquals(0,returned.size());

        returned = ArrayUtils.subset(prim,0,20);
        System.assertNotEquals(null,returned);
        System.assertEquals(3,returned.size());

        prim = null;
        returned = ArrayUtils.subset(prim,0,2);
        System.assertNotEquals(null,returned);
        System.assertEquals(0,returned.size());


            //subset({1,2,3},0,3)={1,2,3}
    //subset({1,2,3},1,3)={2,3}
    //subset({1,2,3},2,3)={3}
    //subset({1,2,3},3,3)={}
    //subset({1,2,3},0,2)={1,2}
    //subset({1,2,3},1,2)={2,3}
    //subset({1,2,3},2,2)={3}
        
    }
        
}
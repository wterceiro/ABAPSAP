CLASS zcl_console_demo DEFINITION
  public
  create public.
  PUBLIC SECTION.
    METHODS: constructor,
             show_data              "  método public que é acessivel por outras classes :  retorna a soma dos valores protected e private
             retURNING VALUE(lv_result) type i,
             show_data2             "  método public que é acessível por outras classes : retorna um campo chamdo protected_value que é definido aqui,
                                    "  por isso ele é um campo Public.
             returninG VALUE(protected_value) tYPE string,
             show_data3
             retURNING VALUE(lv_result3) type i, " método public que é acessível por outras classes : retorna o valor protected "protected_value"
                                                 " definido na sessao protected através do método protected show_data_prot
             show_data4
             retURNING VALUE(lv_result4) type i. " método public que é acessível por outras classes : retorna o valor Private "private_value"
                                                 " definido na sessao Private através do método private show_data_private
  PROTECTED SECTION.
    DATA: protected_value TYPE i.
    METHODS: show_data_prot
             returNING VALUE(lv_result_prot) type i.
  PRIVATE SECTION.
    DATA: private_value TYPE i.
    METHODS: show_data_private
             returNING VALUE(lv_result_private) type i.
ENDCLASS.

CLASS zcl_console_demo IMPLEMENTATION.

  METHOD constructor.
    protected_value = 0.
    private_value   = 0.
  ENDMETHOD.

  METHOD show_data.
    data lv_result_public type string.
    protected_value = 100.
    " To access private_value, this public method can do so internally
    private_value = 200.
    lv_result = protected_value + private_value.
  ENDMETHOD.

  METHOD show_data2.
* o campo protected_value não é o mesmo definido na Protected Section. Mesmo que sejam iguais, ele define este como Public pois foi redefinindo no return da PUblic Section.
* os valores dos campos Proteced e Private somente conseguem ser manipulados e retornados pelos métodos definidos na Public Section.
   protected_value = 'Hello World'.
  ENDMETHOD.

  METHOD show_data3.
     lv_result3 = me->show_data_prot(  ).
  ENDMETHOD.

  METHOD show_data4.
     lv_result4 = me->show_data_private(  ).
  ENDMETHOD.

  METHOD show_data_prot.
* Esse método Protected, seta o valor do campo definido na sessão protected com valor 500 e retorna como resulado ls_result_prot que também é protected
* somente métodos na sessão public conseguem acessar esse valor.
* no caso do show_data3, metodo public, eu obtive atraves do metodo protected show_data_prot, o valor e retornei ele para o programa da console.
    protected_value = 500.
    lv_result_prot = protected_value.
  ENDMETHOD.

    METHOD show_data_private.
* Esse método Private, seta o valor do campo definido na sessão Private com valor 700 e retorna como resulado ls_result_private que também é private
* somente métodos na sessão public conseguem acessar esse valor.
* no caso do show_data4, metodo public, eu obtive atraves do metodo private show_data_private, o valor e retornei ele para o programa da console.
    private_value = 700.
    lv_result_private = private_value.
  ENDMETHOD.

ENDCLASS.

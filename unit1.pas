unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Math, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { Tfrm_main }

  Tfrm_main = class(TForm)
    btnCalc: TButton;
    edtCost: TEdit;
    edtInvestPeriods: TEdit;
    edtTotalPeriods: TEdit;
    edtRate: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblResult: TLabel;
    MemoResult: TMemo;
    procedure btnCalcClick(Sender: TObject);
  private

  public

  end;

var
  frm_main: Tfrm_main;

implementation

{$R *.lfm}

{ Tfrm_main }

procedure Tfrm_main.btnCalcClick(Sender: TObject);
var
  cost,rate: Real;
  total: Real = 0;
  income: Real = 0;
  investPeriods,totalPeriods : Integer;
  i : Integer = 1;
  result :String = '';
begin
  cost := StrToFloat(edtCost.Text);
  investPeriods := StrToInt(edtInvestPeriods.Text);
  totalPeriods := StrToInt(edtTotalPeriods.Text);
  rate := 1 + StrToFloat(edtRate.Text);
  for i := 1 to investPeriods do
  begin
     income := cost*Power(rate,totalPeriods-i);
     result := result + format('第%d期产生的总收入为%f*%f^%d=%f'+#13#10,[i,cost,rate,totalPeriods-i,income]);
     total := total + income;
  end;
  result := result + format('总收入为:%f',[total]);
  memoResult.Text:=result;
end;

end.


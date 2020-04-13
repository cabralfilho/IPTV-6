var _billingReferralsRows = 0;

function billingReferralsAdd()
{
    _billingReferralsRows++;

    var tr = "<tr id='tr_" + _billingReferralsRows + "'>";

    tr+= "<td>#</td>";
    tr+= "<td><input name='added_bonus[" + _billingReferralsRows + "][plugin]' class='edit bk' type='text' style='width: 100%'></td>";
    tr+= "<td><input name='added_bonus[" + _billingReferralsRows + "][desc]' class='edit bk' type='text' style='width: 100%'></td>";
    tr+= "<td><select name='added_bonus[" + _billingReferralsRows + "][act]' style='width: 100%'><option>-</option><option>+</option></select></td>";
    tr+= "<td><input name='added_bonus[" + _billingReferralsRows + "][sum]' placeholder='>0.00' class='edit bk' type='text' style='width: 100%'></td>";
    tr+= "<td><input name='added_bonus[" + _billingReferralsRows + "][bonus]' placeholder='0.00' class='edit bk' type='text' style='width: 40%'>";
    tr+= "&nbsp;&mdash;&nbsp;<input name='added_bonus[" + _billingReferralsRows + "][bonus_percent]' placeholder='10' class='edit bk' type='text' style='width: 20%'> %</td>";
    tr+= "<td style='text-align: center'><i class='icon-trash' onClick='billingReferralsRemove(" + _billingReferralsRows + ");' style='cursor: pointer'></i></td>";

    tr += "</tr>";

    $("#bonuses-list").append(tr);
}

function billingReferralsRemove( id )
{
    $("#tr_" + id).remove();
}

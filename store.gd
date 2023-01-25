extends Panel

var money = 0
var HD_RU = 0
var HD_price = 0.1*pow(1.03,HD_RU)
var NUC =0.4*pow(1.07,HD_RU)

func _ready():
	UpdateUI()

func UpdateUI():
	$MoneyLabel.text = "$" + str(money).pad_decimals(2)
	$HotDogPrice.text = "$" + str(HD_price).pad_decimals(2)
	$HotDogUpgradeCount.text = str(HD_RU)
	$NextUpgradeCost.text ="Next Upgrade: " + "$" + str(NUC).pad_decimals(2)

func _on_hot_dog_sale_pressed():
	money = money + HD_price
	UpdateUI()

func _on_hot_dog_upgrade_pressed():
	if money >= NUC:
		HD_RU = HD_RU + 1
		HD_price = 0.1*pow(1.06,HD_RU)
		money = money - NUC
		NUC =0.4*pow(1.07,HD_RU)
	UpdateUI()

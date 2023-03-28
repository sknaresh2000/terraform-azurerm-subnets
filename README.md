## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg-rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg-subnet-association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.subnet-routetable-association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | The address prefixes to use for the subnet | `string` | n/a | yes |
| <a name="input_delegation_details"></a> [delegation\_details](#input\_delegation\_details) | Delegation details for the created subnet | <pre>map(object({<br>    service_name = string<br>    actions      = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource group to create | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | The name of the network security group that will be created along with subnet | `string` | n/a | yes |
| <a name="input_nsg_rg_name"></a> [nsg\_rg\_name](#input\_nsg\_rg\_name) | Name of the resource group where the nsg will be created | `string` | n/a | yes |
| <a name="input_nsgrules"></a> [nsgrules](#input\_nsgrules) | NSG rules that will be created in the NSG associated with the subnet | <pre>map(object({<br>    name                         = string<br>    priority                     = number<br>    direction                    = string<br>    access                       = string<br>    protocol                     = string<br>    source_port_range            = string<br>    destination_port_range       = string<br>    source_port_ranges           = string<br>    destination_port_ranges      = string<br>    source_address_prefix        = string<br>    destination_address_prefix   = string<br>    source_address_prefixes      = list(string)<br>    destination_address_prefixes = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_private_endpoint_network_policies_enabled"></a> [private\_endpoint\_network\_policies\_enabled](#input\_private\_endpoint\_network\_policies\_enabled) | Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. | `bool` | `null` | no |
| <a name="input_rt_table_id"></a> [rt\_table\_id](#input\_rt\_table\_id) | Route table id that needs to be associated with this subnet | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Mapping of tags | `map(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the vnet where the subnet should be created | `string` | n/a | yes |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | The name of the resource group where the subnet should be created. This should be same as vnet resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the created subnet |
| <a name="output_name"></a> [name](#output\_name) | The name of the created subnet |
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | The id of the network security group |

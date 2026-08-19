/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  LogClassDecorator,
  CountClassDecorator,
  LogPropertyDecorator,
  Entity,
  EntityLegacyConfig,
  Column,
  PrimaryKey,
  RangePropertyDecorator,
  ValidationClassDecorator,
  SingletonClassDecorator,
  MonitorClassDecorator,
  PerformanceClassDecorator,
  AuditClassDecorator,
  TransactionClassDecorator,
  SecurityClassDecorator,
  TraceClassDecorator,
  ObservableClassDecorator,
  NotNull,
  Unique,
  Indexed,
  Encrypted,
  CachedPropertyDecorator,
  Required,
  LogMethodDecorator,
  MeasureMethodDecorator,
  CacheMethodDecorator,
  ThrottleMethodDecorator,
  DebounceMethodDecorator,
  RetryMethodDecorator,
  ValidateMethodDecorator,
  TransactionMethodDecorator,
  AuditMethodDecorator,
  SecurityMethodDecorator,
  PermissionMethodDecorator,
  TraceMethodDecorator,
  ReadOnlyMethodDecorator
} from './Decorators';
import { collections } from '@kit.ArkTS';

const feedRequestConfig: EntityLegacyConfig = new EntityLegacyConfig('feed.request');
const userProfileConfig: EntityLegacyConfig = new EntityLegacyConfig('user.profile');
const transactionConfig: EntityLegacyConfig = new EntityLegacyConfig('transaction.record');
const cacheEntryConfig: EntityLegacyConfig = new EntityLegacyConfig('cache.entry');
const orderConfig: EntityLegacyConfig = new EntityLegacyConfig('ecommerce.order');
const productConfig: EntityLegacyConfig = new EntityLegacyConfig('ecommerce.product');
const commentConfig: EntityLegacyConfig = new EntityLegacyConfig('social.comment');
const shoppingCartConfig: EntityLegacyConfig = new EntityLegacyConfig('ecommerce.cart');
const paymentConfig: EntityLegacyConfig = new EntityLegacyConfig('finance.payment');
const inventoryConfig: EntityLegacyConfig = new EntityLegacyConfig('inventory.stock');
const auditLogConfig: EntityLegacyConfig = new EntityLegacyConfig('system.audit_log');
const userRoleConfig: EntityLegacyConfig = new EntityLegacyConfig('system.user_role');

@Sendable
@LogClassDecorator
export class ClassDecoratorStackSendable {
  public value: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();

  getValue(): number {
    this.logs.push('getValue');
    return this.value;
  }
}

@Sendable
@LogClassDecorator
@CountClassDecorator
export class MultiClassDecoratorStackSendable {
  public data: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();

  compute(): number {
    this.logs.push('compute');
    return this.data * 10;
  }
}

@Sendable
export class PropertyDecoratorStackSendable {
  @LogPropertyDecorator
  public propValue: number = 0;

  @LogPropertyDecorator
  public stringValue: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();
}

@Sendable
export class MethodDecoratorStackSendable {
  public value: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();

  compute(x: number, y: number): number {
    this.logs.push('compute:' + x.toString() + ',' + y.toString());
    return x + y;
  }

  getValue(): number {
    this.logs.push('getValue');
    return this.value;
  }
}

@Sendable
@Entity(feedRequestConfig)
export class FeedRequestSendableModel {
  @Column('type')
  public type: number = 0;

  @Column('cursor')
  public cursor: bigint = BigInt(0);

  @Column('data')
  public data: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  toJson(): string {
    return JSON.stringify({
      type: this.type,
      cursor: this.cursor.toString(),
      data: this.data
    });
  }
}

@Sendable
@LogClassDecorator
export class BaseDecoratorSendable {
  @LogPropertyDecorator
  public baseProp: number = 10;

  public logs: collections.Array<string> = new collections.Array<string>();

  @LogMethodDecorator
  getBaseProp(): number {
    this.logs.push('getBaseProp');
    return this.baseProp;
  }
}

@Sendable
export class DerivedDecoratorSendable extends BaseDecoratorSendable {
  @LogPropertyDecorator
  public derivedProp: number = 20;

  public derivedLogs: collections.Array<string> = new collections.Array<string>();

  @LogMethodDecorator
  getDerivedProp(): number {
    this.derivedLogs.push('getDerivedProp');
    return this.derivedProp;
  }
}

@Sendable
@MonitorClassDecorator
@PerformanceClassDecorator
export class PerformanceMonitorSendable {
  public metrics: collections.Array<string> = new collections.Array<string>();

  @MeasureMethodDecorator
  recordMetric(name: string, value: number): void {
    this.metrics.push(name + ':' + value.toString());
  }
}

@Sendable
@ValidationClassDecorator
export class ValidatedDataSendable {
  @NotNull
  @RangePropertyDecorator(0, 100)
  public score: number = 0;

  @Required
  public name: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  @ValidateMethodDecorator
  validate(): boolean {
    return this.score >= 0 && this.score <= 100 && this.name.length > 0;
  }
}

@Sendable
@SingletonClassDecorator
@ObservableClassDecorator
export class ObservableStateSendable {
  @LogPropertyDecorator
  public stateValue: number = 0;

  @CachedPropertyDecorator('state_label')
  public stateLabel: string = 'init';

  public logs: collections.Array<string> = new collections.Array<string>();

  @LogMethodDecorator
  @MeasureMethodDecorator
  updateState(newValue: number): void {
    this.stateValue = newValue;
    this.logs.push('updateState:' + newValue.toString());
  }
}

@Sendable
@Entity(userProfileConfig)
@ValidationClassDecorator
export class UserProfileSendableModel {
  @Column('user_id')
  @PrimaryKey
  @Unique
  public userId: string = '';

  @Column('username')
  @Required
  @NotNull
  public username: string = '';

  @Column('email')
  @Required
  public email: string = '';

  @Column('age')
  @RangePropertyDecorator(0, 150)
  public age: number = 0;

  @Column('balance')
  public balance: bigint = BigInt(0);

  public logs: collections.Array<string> = new collections.Array<string>();

  @ValidateMethodDecorator
  isValid(): boolean {
    return this.userId.length > 0 &&
      this.username.length > 0 &&
      this.email.includes('@') &&
      this.age >= 0 &&
      this.age <= 150;
  }

  @ValidateMethodDecorator
  validate(): boolean {
    return this.isValid();
  }
}

@Sendable
@Entity(transactionConfig)
@TransactionClassDecorator
@AuditClassDecorator
export class TransactionSendableModel {
  @Column('tx_id')
  @PrimaryKey
  public txId: string = '';

  @Column('from_account')
  @Required
  public fromAccount: string = '';

  @Column('to_account')
  @Required
  public toAccount: string = '';

  @Column('amount')
  @RangePropertyDecorator(1, 1000000000)
  public amount: bigint = BigInt(0);

  @Column('timestamp')
  public timestamp: number = 0;

  @Column('signature')
  @Encrypted
  public signature: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  execute(): boolean {
    this.logs.push('execute: ' + this.txId);
    return this.amount > BigInt(0);
  }
}

@Sendable
@SecurityClassDecorator
export class SecureOperationSendable {
  @Encrypted
  public secretData: string = '';

  @LogPropertyDecorator
  public operationCount: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  @SecurityMethodDecorator
  @PermissionMethodDecorator('admin')
  @LogMethodDecorator
  performSecureOperation(data: string): boolean {
    this.secretData = data;
    this.operationCount++;
    this.logs.push('secureOp: ' + this.operationCount.toString());
    return true;
  }

  @AuditMethodDecorator
  @TraceMethodDecorator
  auditLog(): string {
    return 'Operations: ' + this.operationCount.toString();
  }
}

@Sendable
@TraceClassDecorator
@PerformanceClassDecorator
export class TracedPerformanceSendable {
  public traceId: string = '';
  public callCount: number = 0;
  public logs: collections.Array<string> = new collections.Array<string>();

  @TraceMethodDecorator
  @MeasureMethodDecorator
  startTrace(id: string): void {
    this.traceId = id;
    this.callCount++;
    this.logs.push('startTrace: ' + id);
  }

  @TraceMethodDecorator
  @MeasureMethodDecorator
  endTrace(): string {
    this.callCount++;
    this.logs.push('endTrace: ' + this.traceId);
    return this.traceId;
  }

  @CacheMethodDecorator('trace_result')
  @LogMethodDecorator
  getTraceResult(): string {
    return 'Trace: ' + this.traceId + ', Calls: ' + this.callCount.toString();
  }
}

@Sendable
export class ComplexDecoratorStackSendable {
  public primaryValue: number = 100;
  public secondaryValue: number = 50;
  public secureToken: string = '';
  public logs: collections.Array<string> = new collections.Array<string>();

  compute(x: number, y: number): number {
    this.logs.push('compute: ' + x.toString() + ',' + y.toString());
    return x * y + this.primaryValue + this.secondaryValue;
  }

  validateAndProcess(): boolean {
    this.logs.push('validateAndProcess');
    return this.primaryValue > 0 && this.secondaryValue >= 0;
  }

  throttledOperation(): void {
    this.logs.push('throttledOperation');
  }
}

@Sendable
@Entity(cacheEntryConfig)
@SingletonClassDecorator
export class CacheEntrySendableModel {
  @Column('cache_key')
  @PrimaryKey
  @Indexed
  public cacheKey: string = '';

  @Column('cache_value')
  @CachedPropertyDecorator('entry_value')
  public cacheValue: string = '';

  @Column('ttl')
  @RangePropertyDecorator(0, 86400)
  public ttl: number = 3600;

  @Column('created_at')
  public createdAt: number = 0;

  @Column('is_valid')
  @NotNull
  public isValid: boolean = true;

  public logs: collections.Array<string> = new collections.Array<string>();

  @CacheMethodDecorator('cache_validate')
  @ValidateMethodDecorator
  @LogMethodDecorator
  isExpired(): boolean {
    const now: number = Date.now();
    const elapsed: number = (now - this.createdAt) / 1000;
    this.logs.push('isExpired: elapsed=' + elapsed.toString());
    return elapsed > this.ttl;
  }

  @AuditMethodDecorator
  @TraceMethodDecorator
  refresh(): void {
    this.createdAt = Date.now();
    this.logs.push('refresh: ' + this.createdAt.toString());
  }
}

@Sendable
@LogClassDecorator
export class MultiFeatureSendable {
  @LogPropertyDecorator
  @CachedPropertyDecorator('feature_data')
  public featureData: string = '';

  @RangePropertyDecorator(0, 100)
  public priority: number = 50;

  @Encrypted
  public internalToken: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  @LogMethodDecorator
  @MeasureMethodDecorator
  processFeature(): string {
    this.logs.push('processFeature');
    return 'Processed: ' + this.featureData;
  }

  @ValidateMethodDecorator
  @AuditMethodDecorator
  @TraceMethodDecorator
  validateFeature(): boolean {
    this.logs.push('validateFeature');
    return this.featureData.length > 0 && this.priority >= 0;
  }

  @SecurityMethodDecorator
  @PermissionMethodDecorator('admin')
  @LogMethodDecorator
  secureFeatureAccess(): boolean {
    this.logs.push('secureFeatureAccess');
    return this.internalToken.length > 0;
  }

  @CacheMethodDecorator('feature_result')
  @MeasureMethodDecorator
  @LogMethodDecorator
  getCachedResult(): string {
    return 'Result: ' + this.featureData + ', Priority: ' + this.priority.toString();
  }
}

// ========================================
// E-commerce Database ORM Models
// ========================================

@Sendable
@Entity(orderConfig)
@TransactionClassDecorator
@AuditClassDecorator
export class OrderSendableModel {
  @Column('order_id')
  @PrimaryKey
  @Unique
  public orderId: string = '';

  @Column('user_id')
  @Required
  @Indexed
  public userId: string = '';

  @Column('product_list')
  public productList: collections.Array<string> = new collections.Array<string>();

  @Column('total_amount')
  @RangePropertyDecorator(0, 10000000)
  public totalAmount: bigint = BigInt(0);

  @Column('order_status')
  public orderStatus: number = 0; // 0: pending, 1: paid, 2: shipped, 3: completed

  @Column('created_at')
  public createdAt: number = 0;

  @Column('updated_at')
  public updatedAt: number = 0;

  @Column('shipping_address')
  public shippingAddress: string = '';

  @Column('payment_method')
  public paymentMethod: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(orderId: string, userId: string) {
    this.orderId = orderId;
    this.userId = userId;
    this.createdAt = Date.now();
    this.updatedAt = Date.now();
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  createOrder(): boolean {
    this.logs.push('createOrder: ' + this.orderId);
    return this.orderId.length > 0 && this.userId.length > 0;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateOrder(): boolean {
    return this.orderId.length > 0 &&
      this.userId.length > 0 &&
      this.totalAmount >= BigInt(0);
  }

  @LogMethodDecorator
  addProduct(productId: string, price: bigint): void {
    this.productList.push(productId);
    this.totalAmount = this.totalAmount + price;
    this.updatedAt = Date.now();
    this.logs.push('addProduct: ' + productId);
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  calculateTotal(): bigint {
    return this.totalAmount;
  }
}

@Sendable
@Entity(productConfig)
@ValidationClassDecorator
@ObservableClassDecorator
export class ProductSendableModel {
  @Column('product_id')
  @PrimaryKey
  @Unique
  public productId: string = '';

  @Column('product_name')
  @Required
  @NotNull
  public productName: string = '';

  @Column('category')
  @Indexed
  public category: string = '';

  @Column('price')
  @RangePropertyDecorator(0, 1000000000)
  public price: bigint = BigInt(0);

  @Column('stock_quantity')
  @RangePropertyDecorator(0, 1000000)
  public stockQuantity: number = 0;

  @Column('description')
  public description: string = '';

  @Column('image_url')
  public imageUrl: string = '';

  @Column('rating')
  @RangePropertyDecorator(0, 5)
  public rating: number = 0;

  @Column('review_count')
  public reviewCount: number = 0;

  @Column('seller_id')
  @Indexed
  public sellerId: string = '';

  @Column('created_at')
  public createdAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(productId: string, productName: string, price: bigint) {
    this.productId = productId;
    this.productName = productName;
    this.price = price;
    this.createdAt = Date.now();
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateProduct(): boolean {
    return this.productId.length > 0 &&
      this.productName.length > 0 &&
      this.price > BigInt(0);
  }

  @LogMethodDecorator
  updateStock(quantity: number): boolean {
    if (this.stockQuantity >= quantity) {
      this.stockQuantity = this.stockQuantity - quantity;
      this.logs.push('updateStock: -' + quantity.toString());
      return true;
    }
    return false;
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  updateRating(newRating: number): void {
    const totalRating: number = this.rating * this.reviewCount + newRating;
    this.reviewCount = this.reviewCount + 1;
    this.rating = totalRating / this.reviewCount;
    this.logs.push('updateRating: ' + this.rating.toString());
  }
}

@Sendable
@Entity(commentConfig)
@AuditClassDecorator
@SecurityClassDecorator
export class CommentSendableModel {
  @Column('comment_id')
  @PrimaryKey
  public commentId: string = '';

  @Column('user_id')
  @Required
  @Indexed
  public userId: string = '';

  @Column('product_id')
  @Required
  @Indexed
  public productId: string = '';

  @Column('comment_text')
  @NotNull
  public commentText: string = '';

  @Column('rating')
  @RangePropertyDecorator(1, 5)
  public rating: number = 5;

  @Column('created_at')
  public createdAt: number = 0;

  @Column('is_approved')
  public isApproved: boolean = false;

  @Column('parent_comment_id')
  public parentCommentId: string = ''; // For nested comments

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(commentId: string, userId: string, productId: string) {
    this.commentId = commentId;
    this.userId = userId;
    this.productId = productId;
    this.createdAt = Date.now();
  }

  @AuditMethodDecorator
  @SecurityMethodDecorator
  @LogMethodDecorator
  submitComment(): boolean {
    this.logs.push('submitComment: ' + this.commentId);
    return this.commentText.length > 0 && this.rating >= 1 && this.rating <= 5;
  }

  @LogMethodDecorator
  approveComment(): void {
    this.isApproved = true;
    this.logs.push('approveComment: ' + this.commentId);
  }
}

@Sendable
@Entity(shoppingCartConfig)
@LogClassDecorator
@MonitorClassDecorator
export class ShoppingCartSendableModel {
  @Column('cart_id')
  @PrimaryKey
  public cartId: string = '';

  @Column('user_id')
  @Required
  @Indexed
  @Unique
  public userId: string = '';

  @Column('product_items')
  public productItems: collections.Array<string> = new collections.Array<string>();

  @Column('quantities')
  public quantities: collections.Array<number> = new collections.Array<number>();

  @Column('total_price')
  public totalPrice: bigint = BigInt(0);

  @Column('created_at')
  public createdAt: number = 0;

  @Column('updated_at')
  public updatedAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(cartId: string, userId: string) {
    this.cartId = cartId;
    this.userId = userId;
    this.createdAt = Date.now();
    this.updatedAt = Date.now();
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  addProduct(productId: string, quantity: number, price: bigint): void {
    this.productItems.push(productId);
    this.quantities.push(quantity);
    this.totalPrice = this.totalPrice + price * BigInt(quantity);
    this.updatedAt = Date.now();
    this.logs.push('addProduct: ' + productId + ', qty: ' + quantity.toString());
  }

  @LogMethodDecorator
  removeProduct(productId: string, price: bigint): boolean {
    const index: number = this.productItems.indexOf(productId);
    if (index >= 0) {
      const quantity: number = this.quantities[index];
      this.productItems.splice(index, 1);
      this.quantities.splice(index, 1);
      this.totalPrice = this.totalPrice - price * BigInt(quantity);
      this.updatedAt = Date.now();
      this.logs.push('removeProduct: ' + productId);
      return true;
    }
    return false;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateCart(): boolean {
    return this.cartId.length > 0 &&
      this.userId.length > 0 &&
      this.productItems.length > 0;
  }

  @MeasureMethodDecorator
  clearCart(): void {
    this.productItems = new collections.Array<string>();
    this.quantities = new collections.Array<number>();
    this.totalPrice = BigInt(0);
    this.updatedAt = Date.now();
    this.logs.push('clearCart');
  }
}

@Sendable
@Entity(paymentConfig)
@TransactionClassDecorator
@SecurityClassDecorator
@AuditClassDecorator
export class PaymentSendableModel {
  @Column('payment_id')
  @PrimaryKey
  @Unique
  public paymentId: string = '';

  @Column('order_id')
  @Required
  @Indexed
  public orderId: string = '';

  @Column('user_id')
  @Required
  @Indexed
  public userId: string = '';

  @Column('amount')
  @RangePropertyDecorator(1, 1000000000)
  public amount: bigint = BigInt(0);

  @Column('payment_method')
  public paymentMethod: string = ''; // 'credit_card', 'debit_card', 'wallet', 'bank_transfer'

  @Column('payment_status')
  public paymentStatus: number = 0; // 0: pending, 1: success, 2: failed, 3: refunded

  @Column('transaction_id')
  @Unique
  public transactionId: string = '';

  @Column('payment_time')
  public paymentTime: number = 0;

  @Column('currency')
  public currency: string = 'CNY';

  @Encrypted
  public cardInfo: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(paymentId: string, orderId: string, userId: string, amount: bigint) {
    this.paymentId = paymentId;
    this.orderId = orderId;
    this.userId = userId;
    this.amount = amount;
    this.paymentTime = Date.now();
  }

  @TransactionMethodDecorator
  @SecurityMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  processPayment(): boolean {
    this.logs.push('processPayment: ' + this.paymentId);
    return this.amount > BigInt(0) && this.paymentMethod.length > 0;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validatePayment(): boolean {
    return this.paymentId.length > 0 &&
      this.orderId.length > 0 &&
      this.amount > BigInt(0);
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  refundPayment(): boolean {
    if (this.paymentStatus === 1) {
      this.paymentStatus = 3;
      this.logs.push('refundPayment: ' + this.paymentId);
      return true;
    }
    return false;
  }
}

// ========================================
// Inventory & Stock Management Models
// ========================================

@Sendable
@Entity(inventoryConfig)
@ValidationClassDecorator
@ObservableClassDecorator
export class InventorySendableModel {
  @Column('inventory_id')
  @PrimaryKey
  public inventoryId: string = '';

  @Column('product_id')
  @Required
  @Indexed
  @Unique
  public productId: string = '';

  @Column('warehouse_id')
  @Indexed
  public warehouseId: string = '';

  @Column('stock_quantity')
  @RangePropertyDecorator(0, 10000000)
  public stockQuantity: number = 0;

  @Column('reserved_quantity')
  @RangePropertyDecorator(0, 10000000)
  public reservedQuantity: number = 0;

  @Column('available_quantity')
  public availableQuantity: number = 0;

  @Column('reorder_threshold')
  @RangePropertyDecorator(0, 100000)
  public reorderThreshold: number = 100;

  @Column('last_updated')
  public lastUpdated: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(inventoryId: string, productId: string, initialStock: number) {
    this.inventoryId = inventoryId;
    this.productId = productId;
    this.stockQuantity = initialStock;
    this.availableQuantity = initialStock;
    this.lastUpdated = Date.now();
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  checkAvailability(quantity: number): boolean {
    return this.availableQuantity >= quantity;
  }

  @LogMethodDecorator
  reserveStock(quantity: number): boolean {
    if (this.availableQuantity >= quantity) {
      this.reservedQuantity = this.reservedQuantity + quantity;
      this.availableQuantity = this.availableQuantity - quantity;
      this.lastUpdated = Date.now();
      this.logs.push('reserveStock: ' + quantity.toString());
      return true;
    }
    return false;
  }

  @LogMethodDecorator
  releaseReservedStock(quantity: number): void {
    if (this.reservedQuantity >= quantity) {
      this.reservedQuantity = this.reservedQuantity - quantity;
      this.availableQuantity = this.availableQuantity + quantity;
      this.lastUpdated = Date.now();
      this.logs.push('releaseReservedStock: ' + quantity.toString());
    }
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  addStock(quantity: number): void {
    this.stockQuantity = this.stockQuantity + quantity;
    this.availableQuantity = this.availableQuantity + quantity;
    this.lastUpdated = Date.now();
    this.logs.push('addStock: ' + quantity.toString());
  }

  @ValidateMethodDecorator
  needsReorder(): boolean {
    return this.availableQuantity < this.reorderThreshold;
  }
}

// ========================================
// System Audit & Security Models
// ========================================

@Sendable
@Entity(auditLogConfig)
@AuditClassDecorator
@TraceClassDecorator
export class AuditLogSendableModel {
  @Column('log_id')
  @PrimaryKey
  public logId: string = '';

  @Column('user_id')
  @Indexed
  public userId: string = '';

  @Column('action')
  @Required
  public action: string = ''; // 'create', 'update', 'delete', 'login', 'logout'

  @Column('entity_type')
  @Indexed
  public entityType: string = ''; // 'order', 'product', 'user', 'payment'

  @Column('entity_id')
  @Indexed
  public entityId: string = '';

  @Column('old_value')
  public oldValue: string = '';

  @Column('new_value')
  public newValue: string = '';

  @Column('ip_address')
  public ipAddress: string = '';

  @Column('timestamp')
  public timestamp: number = 0;

  @Column('status')
  public status: number = 0; // 0: success, 1: failed

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(logId: string, userId: string, action: string) {
    this.logId = logId;
    this.userId = userId;
    this.action = action;
    this.timestamp = Date.now();
  }

  @AuditMethodDecorator
  @TraceMethodDecorator
  @LogMethodDecorator
  logAction(): void {
    this.logs.push('logAction: ' + this.action + ' on ' + this.entityType);
  }

  setEntityInfo(entityType: string, entityId: string): void {
    this.entityType = entityType;
    this.entityId = entityId;
    this.logs.push('setEntityInfo: ' + entityType + ':' + entityId);
  }

  setValues(oldValue: string, newValue: string): void {
    this.oldValue = oldValue;
    this.newValue = newValue;
    this.logs.push('setValues');
  }
}

@Sendable
@Entity(userRoleConfig)
@SecurityClassDecorator
@SingletonClassDecorator
export class UserRoleSendableModel {
  @Column('role_id')
  @PrimaryKey
  @Unique
  public roleId: string = '';

  @Column('user_id')
  @Required
  @Indexed
  @Unique
  public userId: string = '';

  @Column('role_name')
  @Required
  @NotNull
  public roleName: string = ''; // 'admin', 'manager', 'user', 'guest'

  @Column('permissions')
  public permissions: collections.Array<string> = new collections.Array<string>();

  @Column('created_at')
  public createdAt: number = 0;

  @Column('expires_at')
  public expiresAt: number = 0;

  @Column('is_active')
  @NotNull
  public isActive: boolean = true;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(roleId: string, userId: string, roleName: string) {
    this.roleId = roleId;
    this.userId = userId;
    this.roleName = roleName;
    this.createdAt = Date.now();
    this.expiresAt = Date.now() + 365 * 24 * 60 * 60 * 1000; // 1 year
  }

  @SecurityMethodDecorator
  @PermissionMethodDecorator('admin')
  @LogMethodDecorator
  hasPermission(permission: string): boolean {
    return this.permissions.indexOf(permission) >= 0 && this.isActive;
  }

  @LogMethodDecorator
  addPermission(permission: string): void {
    if (this.permissions.indexOf(permission) < 0) {
      this.permissions.push(permission);
      this.logs.push('addPermission: ' + permission);
    }
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateRole(): boolean {
    return this.roleId.length > 0 &&
      this.userId.length > 0 &&
      this.roleName.length > 0;
  }

  @LogMethodDecorator
  deactivateRole(): void {
    this.isActive = false;
    this.logs.push('deactivateRole: ' + this.roleId);
  }
}

// ========================================
// Nested & Complex Object Models
// ========================================

@Sendable
@LogClassDecorator
@ValidationClassDecorator
export class UserNestedProfileSendable {
  @LogPropertyDecorator
  public userId: string = '';

  @LogPropertyDecorator
  public username: string = '';

  @LogPropertyDecorator
  public email: string = '';

  @RangePropertyDecorator(0, 150)
  public age: number = 0;

  @LogPropertyDecorator
  public address: string = '';

  @LogPropertyDecorator
  public phone: string = '';

  public orderHistory: collections.Array<string> = new collections.Array<string>();
  public cartItems: collections.Array<string> = new collections.Array<string>();
  public paymentMethods: collections.Array<string> = new collections.Array<string>();

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(userId: string, username: string, email: string) {
    this.userId = userId;
    this.username = username;
    this.email = email;
  }

  @LogMethodDecorator
  @ValidateMethodDecorator
  validateProfile(): boolean {
    return this.userId.length > 0 &&
      this.username.length > 0 &&
      this.email.includes('@');
  }

  @LogMethodDecorator
  addOrder(orderId: string): void {
    this.orderHistory.push(orderId);
    this.logs.push('addOrder: ' + orderId);
  }

  @LogMethodDecorator
  addCartItem(productId: string): void {
    this.cartItems.push(productId);
    this.logs.push('addCartItem: ' + productId);
  }
}

@Sendable
@Entity(orderConfig)
@TransactionClassDecorator
@AuditClassDecorator
export class NestedOrderSendableModel {
  @Column('order_id')
  @PrimaryKey
  public orderId: string = '';

  @Column('user_id')
  @Required
  public userId: string = '';

  public userProfile: UserNestedProfileSendable = new UserNestedProfileSendable('', '', '');
  public productIds: collections.Array<string> = new collections.Array<string>();
  public productPrices: collections.Array<bigint> = new collections.Array<bigint>();
  public quantities: collections.Array<number> = new collections.Array<number>();

  @Column('total_amount')
  public totalAmount: bigint = BigInt(0);

  @Column('order_status')
  public orderStatus: number = 0;

  @Column('created_at')
  public createdAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(orderId: string, userId: string) {
    this.orderId = orderId;
    this.userId = userId;
    this.createdAt = Date.now();
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  createNestedOrder(): boolean {
    this.logs.push('createNestedOrder: ' + this.orderId);
    return this.orderId.length > 0 && this.userId.length > 0;
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  addNestedProduct(productId: string, price: bigint, quantity: number): void {
    this.productIds.push(productId);
    this.productPrices.push(price);
    this.quantities.push(quantity);
    this.totalAmount = this.totalAmount + price * BigInt(quantity);
    this.logs.push('addNestedProduct: ' + productId);
  }

  @ValidateMethodDecorator
  validateNestedOrder(): boolean {
    return this.productIds.length === this.productPrices.length &&
      this.productIds.length === this.quantities.length;
  }
}

// ========================================
// Large Data Collection Models
// ========================================

@Sendable
@LogClassDecorator
@PerformanceClassDecorator
export class LargeDataCollectionSendable {
  @LogPropertyDecorator
  public collectionId: string = '';

  @LogPropertyDecorator
  public dataType: string = '';

  public dataItems: collections.Array<string> = new collections.Array<string>();
  public dataMap: collections.Map<string, string> = new collections.Map<string, string>();
  public indexArray: collections.Array<number> = new collections.Array<number>();

  @RangePropertyDecorator(0, 100000)
  public itemCount: number = 0;

  @LogPropertyDecorator
  public createdAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(collectionId: string, dataType: string) {
    this.collectionId = collectionId;
    this.dataType = dataType;
    this.createdAt = Date.now();
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  addDataItem(item: string): void {
    this.dataItems.push(item);
    this.itemCount = this.itemCount + 1;
    this.logs.push('addDataItem: ' + item);
  }

  @LogMethodDecorator
  addMapItem(key: string, value: string): void {
    this.dataMap.set(key, value);
    this.logs.push('addMapItem: ' + key);
  }

  @LogMethodDecorator
  addIndexItem(index: number): void {
    this.indexArray.push(index);
    this.logs.push('addIndexItem: ' + index.toString());
  }

  @ValidateMethodDecorator
  validateCollection(): boolean {
    return this.collectionId.length > 0 && this.dataType.length > 0;
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  batchAddItems(items: collections.Array<string>): void {
    for (let i: number = 0; i < items.length; i++) {
      this.dataItems.push(items[i]);
      this.itemCount = this.itemCount + 1;
    }
    this.logs.push('batchAddItems: ' + items.length.toString() + ' items');
  }
}

// ========================================
// Complex State Management Models
// ========================================

@Sendable
@ObservableClassDecorator
@MonitorClassDecorator
@LogClassDecorator
export class ComplexStateSendable {
  @LogPropertyDecorator
  @CachedPropertyDecorator('state_id')
  public stateId: string = '';

  @LogPropertyDecorator
  public currentState: number = 0; // State machine: 0=init, 1=processing, 2=success, 3=error

  @LogPropertyDecorator
  public previousState: number = 0;

  @LogPropertyDecorator
  public stateHistory: collections.Array<number> = new collections.Array<number>();

  @LogPropertyDecorator
  public stateTimestamps: collections.Array<number> = new collections.Array<number>();

  @RangePropertyDecorator(0, 1000)
  public transitionCount: number = 0;

  @LogPropertyDecorator
  public lastTransitionTime: number = 0;

  public stateData: collections.Map<string, string> = new collections.Map<string, string>();
  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(stateId: string, initialState: number) {
    this.stateId = stateId;
    this.currentState = initialState;
    this.previousState = initialState;
    this.stateHistory.push(initialState);
    this.stateTimestamps.push(Date.now());
    this.lastTransitionTime = Date.now();
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  transitionTo(newState: number): boolean {
    this.previousState = this.currentState;
    this.currentState = newState;
    this.stateHistory.push(newState);
    this.stateTimestamps.push(Date.now());
    this.transitionCount = this.transitionCount + 1;
    this.lastTransitionTime = Date.now();
    this.logs.push('transitionTo: ' + newState.toString());
    return true;
  }

  @LogMethodDecorator
  rollbackState(): boolean {
    if (this.stateHistory.length > 1) {
      this.currentState = this.previousState;
      this.transitionCount = this.transitionCount + 1;
      this.logs.push('rollbackState: to ' + this.currentState.toString());
      return true;
    }
    return false;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateState(): boolean {
    return this.stateId.length > 0 && this.currentState >= 0 && this.currentState <= 3;
  }

  @LogMethodDecorator
  addStateData(key: string, value: string): void {
    this.stateData.set(key, value);
    this.logs.push('addStateData: ' + key);
  }
}

// ========================================
// Multi-Feature Composite Models
// ========================================

@Sendable
@LogClassDecorator
@ValidationClassDecorator
@ObservableClassDecorator
@MonitorClassDecorator
@PerformanceClassDecorator
export class CompositeFeatureSendable {
  @PrimaryKey
  @Column('feature_id')
  public featureId: string = '';

  @Required
  @Column('feature_name')
  public featureName: string = '';

  @Column('feature_type')
  public featureType: string = '';

  @Column('feature_version')
  public featureVersion: string = '1.0.0';

  @RangePropertyDecorator(0, 100)
  @Column('priority')
  public priority: number = 50;

  @Column('enabled')
  @NotNull
  public enabled: boolean = true;

  @Column('dependencies')
  public dependencies: collections.Array<string> = new collections.Array<string>();

  @Column('config_data')
  public configData: collections.Map<string, string> = new collections.Map<string, string>();

  @Column('created_at')
  public createdAt: number = 0;

  @Column('updated_at')
  public updatedAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(featureId: string, featureName: string, featureType: string) {
    this.featureId = featureId;
    this.featureName = featureName;
    this.featureType = featureType;
    this.createdAt = Date.now();
    this.updatedAt = Date.now();
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateFeature(): boolean {
    return this.featureId.length > 0 &&
      this.featureName.length > 0 &&
      this.featureType.length > 0;
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  enableFeature(): void {
    this.enabled = true;
    this.updatedAt = Date.now();
    this.logs.push('enableFeature: ' + this.featureId);
  }

  @LogMethodDecorator
  disableFeature(): void {
    this.enabled = false;
    this.updatedAt = Date.now();
    this.logs.push('disableFeature: ' + this.featureId);
  }

  @LogMethodDecorator
  addDependency(dependencyId: string): void {
    if (this.dependencies.indexOf(dependencyId) < 0) {
      this.dependencies.push(dependencyId);
      this.updatedAt = Date.now();
      this.logs.push('addDependency: ' + dependencyId);
    }
  }

  setConfig(key: string, value: string): void {
    this.configData.set(key, value);
    this.updatedAt = Date.now();
    this.logs.push('setConfig: ' + key);
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  checkDependencies(): boolean {
    return this.dependencies.length > 0;
  }
}

// ========================================
// Singleton Pattern Models (Private Constructor + Static getInstance)
// ========================================

@Sendable
@LogClassDecorator
@SingletonClassDecorator
@MonitorClassDecorator
export class SingletonDatabaseConnectionSendable {
  private static instance: SingletonDatabaseConnectionSendable | null = null;

  @PrimaryKey
  @Column('connection_id')
  private connectionId: string = 'singleton_db_conn';

  @Column('database_name')
  public databaseName: string = 'default_db';

  @Column('host')
  public host: string = 'localhost';

  @Column('port')
  @RangePropertyDecorator(1, 65535)
  public port: number = 3306;

  @Column('connection_status')
  public connectionStatus: number = 0; // 0: disconnected, 1: connected, 2: error

  @Column('connection_count')
  public connectionCount: number = 0;

  @Column('max_connections')
  @RangePropertyDecorator(1, 100)
  public maxConnections: number = 10;

  @Column('created_at')
  public createdAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  private constructor() {
    this.createdAt = Date.now();
    this.logs.push('SingletonDatabaseConnectionSendable created');
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  static getInstance(): SingletonDatabaseConnectionSendable {
    if (SingletonDatabaseConnectionSendable.instance === null) {
      SingletonDatabaseConnectionSendable.instance = new SingletonDatabaseConnectionSendable();
    }
    SingletonDatabaseConnectionSendable.instance.connectionCount = SingletonDatabaseConnectionSendable.instance.connectionCount + 1;
    SingletonDatabaseConnectionSendable.instance.logs.push('getInstance called: count=' + SingletonDatabaseConnectionSendable.instance.connectionCount.toString());
    return SingletonDatabaseConnectionSendable.instance;
  }

  @LogMethodDecorator
  static resetInstance(): void {
    if (SingletonDatabaseConnectionSendable.instance != null) {
      SingletonDatabaseConnectionSendable.instance.logs.push('resetInstance called');
      SingletonDatabaseConnectionSendable.instance = null;
    }
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  connect(): boolean {
    if (this.connectionStatus === 0 && this.connectionCount < this.maxConnections) {
      this.connectionStatus = 1;
      this.logs.push('connect: success');
      return true;
    }
    this.connectionStatus = 2;
    this.logs.push('connect: failed');
    return false;
  }

  @LogMethodDecorator
  disconnect(): void {
    this.connectionStatus = 0;
    this.connectionCount = this.connectionCount - 1;
    this.logs.push('disconnect');
  }

  @LogMethodDecorator
  static getStaticConnectionStatus(): number {
    if (SingletonDatabaseConnectionSendable.instance !== null) {
      return SingletonDatabaseConnectionSendable.instance.connectionStatus;
    }
    return 0;
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  executeQuery(query: string): string {
    if (this.connectionStatus === 1) {
      this.logs.push('executeQuery: ' + query);
      return 'Query executed: ' + query;
    }
    return 'Error: not connected';
  }
}

@Sendable
@LogClassDecorator
@ValidationClassDecorator
export class SingletonCacheManagerSendable {
  private static instance: SingletonCacheManagerSendable | null = null;

  private cacheId: string = 'singleton_cache_manager';

  public cacheMap: collections.Map<string, string> = new collections.Map<string, string>();

  @RangePropertyDecorator(0, 10000)
  public cacheSize: number = 0;

  @RangePropertyDecorator(1, 10000)
  public maxCacheSize: number = 1000;

  @RangePropertyDecorator(0, 86400)
  public defaultTTL: number = 3600; // 1 hour

  public logs: collections.Array<string> = new collections.Array<string>();

  private constructor() {
    this.logs.push('SingletonCacheManagerSendable created');
  }

  @LogMethodDecorator
  static getInstance(): SingletonCacheManagerSendable {
    if (SingletonCacheManagerSendable.instance === null) {
      SingletonCacheManagerSendable.instance = new SingletonCacheManagerSendable();
    }
    SingletonCacheManagerSendable.instance.logs.push('getInstance called');
    return SingletonCacheManagerSendable.instance;
  }

  @LogMethodDecorator
  static resetInstance(): void {
    if (SingletonCacheManagerSendable.instance !== null) {
      SingletonCacheManagerSendable.instance.clearCache();
      SingletonCacheManagerSendable.instance.logs.push('resetInstance called');
      SingletonCacheManagerSendable.instance = null;
    }
  }

  @LogMethodDecorator
  @MeasureMethodDecorator
  put(key: string, value: string): boolean {
    if (this.cacheSize < this.maxCacheSize) {
      this.cacheMap.set(key, value);
      this.cacheSize = this.cacheSize + 1;
      this.logs.push('put: ' + key);
      return true;
    }
    this.logs.push('put failed: cache full');
    return false;
  }

  @LogMethodDecorator
  get(key: string): string {
    const value: string | undefined = this.cacheMap.get(key);
    if (value !== undefined) {
      this.logs.push('get: ' + key);
      return value;
    }
    this.logs.push('get failed: ' + key + ' not found');
    return '';
  }

  @LogMethodDecorator
  remove(key: string): boolean {
    if (this.cacheMap.has(key)) {
      this.cacheMap.delete(key);
      this.cacheSize = this.cacheSize - 1;
      this.logs.push('remove: ' + key);
      return true;
    }
    return false;
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  clearCache(): void {
    this.cacheMap = new collections.Map<string, string>();
    this.cacheSize = 0;
    this.logs.push('clearCache');
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateCache(): boolean {
    return this.cacheId.length > 0 && this.maxCacheSize > 0;
  }

  @LogMethodDecorator
  static getStaticCacheSize(): number {
    if (SingletonCacheManagerSendable.instance !== null) {
      return SingletonCacheManagerSendable.instance.cacheSize;
    }
    return 0;
  }
}

// ========================================
// Static Methods & Static Properties Models
// ========================================

@Sendable
@LogClassDecorator
@PerformanceClassDecorator
export class StaticUtilitySendable {
  @PrimaryKey
  @Column('utility_id')
  public utilityId: string = '';

  @Column('version')
  public version: string = '1.0.0';

  public logs: collections.Array<string> = new collections.Array<string>();

  // Static properties
  private static totalOperations: number = 0;
  private static maxOperations: number = 10000;
  private static initialized: boolean = false;

  constructor(utilityId: string) {
    this.utilityId = utilityId;
    this.logs.push('StaticUtilitySendable created: ' + utilityId);
  }

  // Static methods
  @LogMethodDecorator
  static initialize(): void {
    StaticUtilitySendable.initialized = true;
    StaticUtilitySendable.totalOperations = 0;
  }

  @LogMethodDecorator
  static isInitialized(): boolean {
    return StaticUtilitySendable.initialized;
  }

  @LogMethodDecorator
  static getTotalOperations(): number {
    return StaticUtilitySendable.totalOperations;
  }

  @LogMethodDecorator
  static incrementOperations(): void {
    if (StaticUtilitySendable.totalOperations < StaticUtilitySendable.maxOperations) {
      StaticUtilitySendable.totalOperations = StaticUtilitySendable.totalOperations + 1;
    }
  }

  @LogMethodDecorator
  static resetOperations(): void {
    StaticUtilitySendable.totalOperations = 0;
  }

  @LogMethodDecorator
  static getMaxOperations(): number {
    return StaticUtilitySendable.maxOperations;
  }

  @LogMethodDecorator
  static setMaxOperations(max: number): void {
    StaticUtilitySendable.maxOperations = max;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateUtility(): boolean {
    return this.utilityId.length > 0;
  }

  // Static method with Sendable parameter
  @LogMethodDecorator
  static processData(data: string): string {
    StaticUtilitySendable.incrementOperations();
    return 'Processed: ' + data;
  }

  // Static method with multiple parameters
  @LogMethodDecorator
  static calculate(a: number, b: number): number {
    StaticUtilitySendable.incrementOperations();
    return a + b;
  }

  // Static method returning Sendable instance
  @LogMethodDecorator
  static getSharedEntityCount(): number {
    return 42;
  }
}

@Sendable
@ValidationClassDecorator
@MonitorClassDecorator
export class StaticCounterSendable {
  @PrimaryKey
  @Column('counter_id')
  public counterId: string = '';

  @Column('name')
  public name: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  // Static counter properties
  private static globalCount: number = 0;
  private static instanceCount: number = 0;
  private static counters: collections.Map<string, number> = new collections.Map<string, number>();

  constructor(counterId: string, name: string) {
    this.counterId = counterId;
    this.name = name;
    StaticCounterSendable.instanceCount = StaticCounterSendable.instanceCount + 1;
    this.logs.push('StaticCounterSendable created: ' + counterId);
  }

  // Static methods for global counter
  @LogMethodDecorator
  static getGlobalCount(): number {
    return StaticCounterSendable.globalCount;
  }

  @LogMethodDecorator
  static incrementGlobal(): void {
    StaticCounterSendable.globalCount = StaticCounterSendable.globalCount + 1;
  }

  @LogMethodDecorator
  static decrementGlobal(): void {
    StaticCounterSendable.globalCount = StaticCounterSendable.globalCount - 1;
  }

  @LogMethodDecorator
  static resetGlobal(): void {
    StaticCounterSendable.globalCount = 0;
  }

  // Static methods for instance counter
  @LogMethodDecorator
  static getInstanceCount(): number {
    return StaticCounterSendable.instanceCount;
  }

  // Static methods for named counters
  @LogMethodDecorator
  static setCounter(name: string, value: number): void {
    StaticCounterSendable.counters.set(name, value);
  }

  @LogMethodDecorator
  static getCounter(name: string): number {
    const value: number | undefined = StaticCounterSendable.counters.get(name);
    return value !== undefined ? value : 0;
  }

  @LogMethodDecorator
  static incrementCounter(name: string): void {
    const current: number = StaticCounterSendable.getCounter(name);
    StaticCounterSendable.setCounter(name, current + 1);
  }

  @LogMethodDecorator
  static getModuleCount(): number {
    return 42;
  }

  @LogMethodDecorator
  static removeCounter(name: string): void {
    StaticCounterSendable.counters.delete(name);
  }

  @LogMethodDecorator
  static clearAllCounters(): void {
    StaticCounterSendable.counters = new collections.Map<string, number>();
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateCounter(): boolean {
    return this.counterId.length > 0 && this.name.length > 0;
  }
}

// ========================================
// Getter/Setter Methods Models
// ========================================

@Sendable
@LogClassDecorator
@ObservableClassDecorator
export class GetterSetterPropertySendable {
  @PrimaryKey
  @Column('property_id')
  public propertyId: string = '';

  private _value: number = 0;
  private _name: string = '';
  private _status: number = 0;
  private _data: string = '';
  private _enabled: boolean = false;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(propertyId: string) {
    this.propertyId = propertyId;
  }

  // Getter for _value
  @LogMethodDecorator
  get value(): number {
    this.logs.push('getter value: ' + this._value.toString());
    return this._value;
  }

  // Setter for _value with validation
  set value(newValue: number) {
    if (newValue >= 0 && newValue <= 1000) {
      this._value = newValue;
      this.logs.push('setter value: ' + newValue.toString());
    } else {
      this.logs.push('setter value failed: invalid range');
    }
  }

  // Getter for _name
  @LogMethodDecorator
  get name(): string {
    this.logs.push('getter name: ' + this._name);
    return this._name;
  }

  // Setter for _name with length validation
  set name(newName: string) {
    if (newName.length > 0 && newName.length <= 100) {
      this._name = newName;
      this.logs.push('setter name: ' + newName);
    }
  }

  // Getter for _status
  @LogMethodDecorator
  get status(): number {
    this.logs.push('getter status: ' + this._status.toString());
    return this._status;
  }

  // Setter for _status with enum validation
  set status(newStatus: number) {
    if (newStatus >= 0 && newStatus <= 5) {
      this._status = newStatus;
      this.logs.push('setter status: ' + newStatus.toString());
    }
  }

  // Getter for _data
  @CachedPropertyDecorator('getter_data')
  @LogMethodDecorator
  get data(): string {
    this.logs.push('getter data');
    return this._data;
  }

  // Setter for _data
  set data(newData: string) {
    this._data = newData;
    this.logs.push('setter data: length=' + newData.length.toString());
  }

  // Getter for _enabled
  @LogMethodDecorator
  get enabled(): boolean {
    this.logs.push('getter enabled: ' + this._enabled.toString());
    return this._enabled;
  }

  // Setter for _enabled
  set enabled(newEnabled: boolean) {
    this._enabled = newEnabled;
    this.logs.push('setter enabled: ' + newEnabled.toString());
  }

  // Computed getter
  @LogMethodDecorator
  get computedValue(): number {
    const computed: number = this._value * 2 + this._status;
    this.logs.push('getter computedValue: ' + computed.toString());
    return computed;
  }

  // Read-only getter (no setter)
  @LogMethodDecorator
  get propertyType(): string {
    return 'GetterSetterPropertySendable';
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  validateProperty(): boolean {
    return this.propertyId.length > 0;
  }
}

@Sendable
@Entity(userProfileConfig)
@ValidationClassDecorator
@AuditClassDecorator
export class GetterSetterEntitySendable {
  @PrimaryKey
  @Column('entity_id')
  public entityId: string = '';

  @Column('entity_type')
  @Indexed
  public entityType: string = '';

  private _count: number = 0;
  private _amount: bigint = BigInt(0);
  private _rate: number = 0.0;
  private _description: string = '';

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(entityId: string, entityType: string) {
    this.entityId = entityId;
    this.entityType = entityType;
  }

  @LogMethodDecorator
  get count(): number {
    this.logs.push('getter count');
    return this._count;
  }

  set count(newCount: number) {
    if (newCount >= 0 && newCount <= 10000) {
      this._count = newCount;
      this.logs.push('setter count: ' + newCount.toString());
    }
  }

  @LogMethodDecorator
  get amount(): bigint {
    this.logs.push('getter amount');
    return this._amount;
  }

  set amount(newAmount: bigint) {
    if (newAmount >= BigInt(0)) {
      this._amount = newAmount;
      this.logs.push('setter amount');
    }
  }

  @LogMethodDecorator
  get rate(): number {
    this.logs.push('getter rate');
    return this._rate;
  }

  set rate(newRate: number) {
    if (newRate >= 0.0 && newRate <= 1.0) {
      this._rate = newRate;
      this.logs.push('setter rate: ' + newRate.toString());
    }
  }

  @LogMethodDecorator
  get description(): string {
    this.logs.push('getter description');
    return this._description;
  }

  set description(newDesc: string) {
    this._description = newDesc;
    this.logs.push('setter description');
  }

  @LogMethodDecorator
  get totalValue(): bigint {
    const total: bigint = this._amount * BigInt(this._count);
    this.logs.push('getter totalValue');
    return total;
  }

  @ValidateMethodDecorator
  @AuditMethodDecorator
  validateEntity(): boolean {
    return this.entityId.length > 0 && this.entityType.length > 0;
  }
}

// ========================================
// Async Methods Models
// ========================================

@Sendable
@LogClassDecorator
@PerformanceClassDecorator
export class AsyncOperationSendable {
  @PrimaryKey
  @Column('operation_id')
  public operationId: string = '';

  @Column('operation_type')
  public operationType: string = '';

  @Column('status')
  public status: number = 0; // 0: pending, 1: running, 2: success, 3: failed

  @Column('result')
  public result: string = '';

  @Column('created_at')
  public createdAt: number = 0;

  @Column('completed_at')
  public completedAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(operationId: string, operationType: string) {
    this.operationId = operationId;
    this.operationType = operationType;
    this.createdAt = Date.now();
  }

  // Async method returning Promise
  @LogMethodDecorator
  @MeasureMethodDecorator
  async executeAsync(): Promise<string> {
    this.status = 1;
    this.logs.push('executeAsync start');

    // Simulate async operation
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    this.status = 2;
    this.result = 'Async operation completed';
    this.completedAt = Date.now();
    this.logs.push('executeAsync success');
    return this.result;
  }

  // Async method with parameter
  @LogMethodDecorator
  async processDataAsync(data: string): Promise<string> {
    this.logs.push('processDataAsync: ' + data);

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return 'Processed: ' + data;
  }

  // Async method returning number
  @LogMethodDecorator
  async calculateAsync(a: number, b: number): Promise<number> {
    this.logs.push('calculateAsync: ' + a.toString() + '+' + b.toString());

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return a + b;
  }

  // Async method with validation
  @ValidateMethodDecorator
  @LogMethodDecorator
  async validateAsync(): Promise<boolean> {
    this.logs.push('validateAsync start');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    const isValid: boolean = this.operationId.length > 0 && this.operationType.length > 0;
    this.logs.push('validateAsync result: ' + isValid.toString());
    return isValid;
  }

  // Async method that may fail
  @LogMethodDecorator
  async executeWithErrorAsync(): Promise<string> {
    this.logs.push('executeWithErrorAsync start');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    if (this.operationId.length === 0) {
      this.status = 3;
      throw new Error('Operation ID is empty');
    }

    return 'Success';
  }

  // Async method returning object
  @LogMethodDecorator
  async getResultAsync(): Promise<AsyncOperationSendable> {
    this.logs.push('getResultAsync');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return this;
  }

  // Static async method
  @LogMethodDecorator
  static async staticAsyncOperation(): Promise<number> {
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return 42;
  }
}

@Sendable
@Entity(transactionConfig)
@TransactionClassDecorator
@AuditClassDecorator
export class AsyncTransactionSendable {
  @PrimaryKey
  @Column('transaction_id')
  public transactionId: string = '';

  @Column('amount')
  @RangePropertyDecorator(1, 1000000000)
  public amount: bigint = BigInt(0);

  @Column('transaction_status')
  public transactionStatus: number = 0; // 0: pending, 1: processing, 2: committed, 3: rollback

  @Column('created_at')
  public createdAt: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  constructor(transactionId: string, amount: bigint) {
    this.transactionId = transactionId;
    this.amount = amount;
    this.createdAt = Date.now();
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  async beginTransactionAsync(): Promise<boolean> {
    this.transactionStatus = 1;
    this.logs.push('beginTransactionAsync');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    return true;
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  async commitAsync(): Promise<boolean> {
    if (this.transactionStatus !== 1) {
      return false;
    }

    this.transactionStatus = 2;
    this.logs.push('commitAsync');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    return true;
  }

  @TransactionMethodDecorator
  @AuditMethodDecorator
  @LogMethodDecorator
  async rollbackAsync(): Promise<boolean> {
    this.transactionStatus = 3;
    this.logs.push('rollbackAsync');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    return true;
  }

  @ValidateMethodDecorator
  @LogMethodDecorator
  async validateTransactionAsync(): Promise<boolean> {
    this.logs.push('validateTransactionAsync');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return this.transactionId.length > 0 && this.amount > BigInt(0);
  }

  @MeasureMethodDecorator
  @LogMethodDecorator
  async executeTransactionAsync(): Promise<string> {
    this.logs.push('executeTransactionAsync start');

    await this.beginTransactionAsync();
    await this.commitAsync();

    return 'Transaction completed';
  }
}

// ========================================
// Namespace & Shared Module Models
// ========================================

namespace SharedDatabaseNamespace {
  @Sendable
  @LogClassDecorator
  @ValidationClassDecorator
  @MonitorClassDecorator
  @Entity(feedRequestConfig)
  @AuditClassDecorator
  export class NamespaceDatabaseEntitySendable {
    @Column('entity_id')
    @PrimaryKey
    @Unique
    @Indexed
    public entityId: string = '';

    @Column('entity_type')
    @Required
    @NotNull
    @Indexed
    public entityType: string = '';

    @Column('entity_data')
    @LogPropertyDecorator
    @CachedPropertyDecorator('entity_data_cache')
    public entityData: string = '';

    @Column('version')
    @RangePropertyDecorator(0, 100)
    public version: number = 0;

    @Column('is_active')
    @NotNull
    public isActive: boolean = true;

    @Encrypted
    @LogPropertyDecorator
    public sensitiveData: string = '';

    public data: collections.Map<string, string> = new collections.Map<string, string>();
    public logs: collections.Array<string> = new collections.Array<string>();

    constructor(entityId: string, entityType: string) {
      this.entityId = entityId;
      this.entityType = entityType;
    }

    @LogMethodDecorator
    @ValidateMethodDecorator
    setData(key: string, value: string): void {
      this.data.set(key, value);
      this.logs.push('setData: ' + key);
    }

    @LogMethodDecorator
    @CacheMethodDecorator('namespace_get_data')
    @MeasureMethodDecorator
    getData(key: string): string {
      const value: string | undefined = this.data.get(key);
      return value !== undefined ? value : '';
    }

    @ValidateMethodDecorator
    @LogMethodDecorator
    validateEntity(): boolean {
      return this.entityId.length > 0 && this.entityType.length > 0;
    }

    @AuditMethodDecorator
    @TraceMethodDecorator
    @LogMethodDecorator
    updateEntityData(newData: string): void {
      this.entityData = newData;
      this.version = this.version + 1;
      this.logs.push('updateEntityData: v' + this.version.toString());
    }

    @SecurityMethodDecorator
    @PermissionMethodDecorator('admin')
    @LogMethodDecorator
    setSensitiveData(data: string): void {
      this.sensitiveData = data;
      this.logs.push('setSensitiveData');
    }

    @MeasureMethodDecorator
    @LogMethodDecorator
    @RetryMethodDecorator(3)
    computeHash(): string {
      const hash: string = this.entityId + ':' + this.entityType + ':' + this.entityData;
      this.logs.push('computeHash');
      return hash;
    }

    private _status: number = 0;

    @LogMethodDecorator
    get status(): number {
      this.logs.push('getter status');
      return this._status;
    }

    set status(newStatus: number) {
      if (newStatus >= 0 && newStatus <= 10) {
        this._status = newStatus;
        this.logs.push('setter status: ' + newStatus.toString());
      }
    }

    @LogMethodDecorator
    static getEntityCount(): number {
      return 42;
    }
  }

  @Sendable
  @ValidationClassDecorator
  @Entity(cacheEntryConfig)
  @LogClassDecorator
  @ObservableClassDecorator
  @PerformanceClassDecorator
  @TraceClassDecorator
  export class NamespaceConfigSendable {
    @Column('config_id')
    @PrimaryKey
    @Unique
    public configId: string = '';

    @Column('config_name')
    @Required
    @NotNull
    @Indexed
    public configName: string = '';

    @Column('config_value')
    @LogPropertyDecorator
    @CachedPropertyDecorator('config_value_cache')
    public configValue: string = '';

    @Column('config_type')
    @Indexed
    public configType: string = '';

    @Column('priority')
    @RangePropertyDecorator(0, 100)
    @LogPropertyDecorator
    public priority: number = 50;

    @Column('is_enabled')
    @NotNull
    public isEnabled: boolean = true;

    @Column('created_at')
    public createdAt: number = 0;

    @Column('updated_at')
    public updatedAt: number = 0;

    @Encrypted
    public configSecret: string = '';

    public logs: collections.Array<string> = new collections.Array<string>();

    constructor(configId: string, configName: string, configValue: string) {
      this.configId = configId;
      this.configName = configName;
      this.configValue = configValue;
      this.createdAt = Date.now();
      this.updatedAt = Date.now();
    }

    @ValidateMethodDecorator
    @LogMethodDecorator
    validateConfig(): boolean {
      return this.configId.length > 0 &&
        this.configName.length > 0 &&
        this.priority >= 0 &&
        this.priority <= 100;
    }

    @LogMethodDecorator
    @MeasureMethodDecorator
    @AuditMethodDecorator
    updateConfig(newValue: string): void {
      this.configValue = newValue;
      this.updatedAt = Date.now();
      this.logs.push('updateConfig');
    }

    @CacheMethodDecorator('namespace_config_result')
    @LogMethodDecorator
    getConfigResult(): string {
      return 'Config: ' + this.configName + '=' + this.configValue;
    }

    @SecurityMethodDecorator
    @PermissionMethodDecorator('admin')
    @LogMethodDecorator
    updateSecret(newSecret: string): void {
      this.configSecret = newSecret;
      this.logs.push('updateSecret');
    }

    @TraceMethodDecorator
    @LogMethodDecorator
    enableConfig(): void {
      this.isEnabled = true;
      this.updatedAt = Date.now();
      this.logs.push('enableConfig');
    }

    @TraceMethodDecorator
    @LogMethodDecorator
    disableConfig(): void {
      this.isEnabled = false;
      this.updatedAt = Date.now();
      this.logs.push('disableConfig');
    }

    private _status: number = 0;

    @LogMethodDecorator
    get status(): number {
      this.logs.push('getter status');
      return this._status;
    }

    set status(newStatus: number) {
      if (newStatus >= 0 && newStatus <= 5) {
        this._status = newStatus;
        this.logs.push('setter status: ' + newStatus.toString());
      }
    }

    @LogMethodDecorator
    get computedPriority(): number {
      return this.priority * this._status;
    }

    @LogMethodDecorator
    @MeasureMethodDecorator
    async validateConfigAsync(): Promise<boolean> {
      this.logs.push('validateConfigAsync start');

      await new Promise<void>((resolve: Function) => {
        setTimeout(resolve, 50);
      });

      return this.configId.length > 0;
    }

    @LogMethodDecorator
    static getMaxPriority(): number {
      return 100;
    }
  }

  @Sendable
  @LogClassDecorator
  @SingletonClassDecorator
  @SecurityClassDecorator
  export class NamespaceSingletonManagerSendable {
    private static instance: NamespaceSingletonManagerSendable | null = null;

    @PrimaryKey
    private managerId: string = 'namespace_singleton_manager';

    @LogPropertyDecorator
    public managerName: string = 'NamespaceManager';

    @RangePropertyDecorator(0, 1000)
    public operationCount: number = 0;

    public managedEntities: collections.Array<string> = new collections.Array<string>();
    public logs: collections.Array<string> = new collections.Array<string>();

    private constructor() {
      this.logs.push('NamespaceSingletonManagerSendable created');
    }

    @LogMethodDecorator
    static getInstance(): NamespaceSingletonManagerSendable {
      if (NamespaceSingletonManagerSendable.instance === null) {
        NamespaceSingletonManagerSendable.instance = new NamespaceSingletonManagerSendable();
      }
      NamespaceSingletonManagerSendable.instance.operationCount = NamespaceSingletonManagerSendable.instance.operationCount + 1;
      return NamespaceSingletonManagerSendable.instance;
    }

    @LogMethodDecorator
    static resetInstance(): void {
      if (NamespaceSingletonManagerSendable.instance !== null) {
        NamespaceSingletonManagerSendable.instance.logs.push('resetInstance');
        NamespaceSingletonManagerSendable.instance = null;
      }
    }

    @SecurityMethodDecorator
    @PermissionMethodDecorator('admin')
    @LogMethodDecorator
    addManagedEntity(entityId: string): void {
      this.managedEntities.push(entityId);
      this.logs.push('addManagedEntity: ' + entityId);
    }

    @LogMethodDecorator
    removeManagedEntity(entityId: string): boolean {
      const index: number = this.managedEntities.indexOf(entityId);
      if (index >= 0) {
        this.managedEntities.splice(index, 1);
        this.logs.push('removeManagedEntity: ' + entityId);
        return true;
      }
      return false;
    }

    @ValidateMethodDecorator
    @LogMethodDecorator
    validateManager(): boolean {
      return this.managerId.length > 0;
    }
  }

  export interface NamespaceEntityConfig {
    id: string;
    type: string;
    timestamp: number;
  }
}

namespace SharedUtilityNamespace {
  @Sendable
  @LogClassDecorator
  @PerformanceClassDecorator
  @MonitorClassDecorator
  @ValidationClassDecorator
  @ObservableClassDecorator
  export class NamespaceUtilitySendable {
    @PrimaryKey
    public utilityId: string = '';

    @LogPropertyDecorator
    @CachedPropertyDecorator('utility_name_cache')
    public utilityName: string = '';

    @LogPropertyDecorator
    public utilityVersion: string = '1.0.0';

    @RangePropertyDecorator(0, 100)
    public utilityLevel: number = 0;

    @NotNull
    public isActive: boolean = true;

    @Encrypted
    public utilitySecret: string = '';

    public utilityData: collections.Map<string, string> = new collections.Map<string, string>();
    public logs: collections.Array<string> = new collections.Array<string>();

    private static instanceCount: number = 0;
    private static maxInstances: number = 100;

    constructor(utilityId: string, utilityName: string) {
      this.utilityId = utilityId;
      this.utilityName = utilityName;
      NamespaceUtilitySendable.instanceCount = NamespaceUtilitySendable.instanceCount + 1;
    }

    @ValidateMethodDecorator
    @LogMethodDecorator
    validate(): boolean {
      return this.utilityId.length > 0 && this.utilityName.length > 0;
    }

    @LogMethodDecorator
    @MeasureMethodDecorator
    @AuditMethodDecorator
    updateUtilityName(newName: string): void {
      this.utilityName = newName;
      this.logs.push('updateUtilityName: ' + newName);
    }

    @LogMethodDecorator
    @CacheMethodDecorator('namespace_utility_result')
    getUtilityInfo(): string {
      return 'Utility: ' + this.utilityId + ', Name: ' + this.utilityName + ', Version: ' + this.utilityVersion;
    }

    @SecurityMethodDecorator
    @PermissionMethodDecorator('admin')
    @LogMethodDecorator
    setUtilitySecret(secret: string): void {
      this.utilitySecret = secret;
      this.logs.push('setUtilitySecret');
    }

    @TraceMethodDecorator
    @LogMethodDecorator
    activateUtility(): void {
      this.isActive = true;
      this.utilityLevel = this.utilityLevel + 1;
      this.logs.push('activateUtility: level=' + this.utilityLevel.toString());
    }

    @TraceMethodDecorator
    @LogMethodDecorator
    deactivateUtility(): void {
      this.isActive = false;
      this.logs.push('deactivateUtility');
    }

    private _status: number = 0;

    @LogMethodDecorator
    get status(): number {
      this.logs.push('getter status');
      return this._status;
    }

    set status(newStatus: number) {
      if (newStatus >= 0 && newStatus <= 10) {
        this._status = newStatus;
        this.logs.push('setter status: ' + newStatus.toString());
      }
    }

    @LogMethodDecorator
    get computedLevel(): number {
      return this.utilityLevel + this._status;
    }

    @LogMethodDecorator
    @MeasureMethodDecorator
    addUtilityData(key: string, value: string): void {
      this.utilityData.set(key, value);
      this.logs.push('addUtilityData: ' + key);
    }

    @LogMethodDecorator
    getUtilityData(key: string): string {
      const value: string | undefined = this.utilityData.get(key);
      return value !== undefined ? value : '';
    }

    @LogMethodDecorator
    @RetryMethodDecorator(3)
    async processUtilityAsync(): Promise<string> {
      this.logs.push('processUtilityAsync start');

      await new Promise<void>((resolve: Function) => {
        setTimeout(resolve, 50);
      });

      return 'Processed: ' + this.utilityId;
    }

    @LogMethodDecorator
    static getDefaultVersion(): string {
      return '1.0.0';
    }

    @LogMethodDecorator
    static getInstanceCount(): number {
      return NamespaceUtilitySendable.instanceCount;
    }

    @LogMethodDecorator
    static getMaxInstances(): number {
      return NamespaceUtilitySendable.maxInstances;
    }

    @LogMethodDecorator
    static resetInstanceCount(): void {
      NamespaceUtilitySendable.instanceCount = 0;
    }

    @LogMethodDecorator
    static async staticProcessAsync(): Promise<number> {
      await new Promise<void>((resolve: Function) => {
        setTimeout(resolve, 50);
      });

      return 42;
    }
  }

  @Sendable
  @LogClassDecorator
  @SingletonClassDecorator
  @ValidationClassDecorator
  export class NamespaceUtilityFactorySendable {
    private static instance: NamespaceUtilityFactorySendable | null = null;

    private factoryId: string = 'namespace_utility_factory';

    @LogPropertyDecorator
    public factoryName: string = 'UtilityFactory';

    @RangePropertyDecorator(0, 10000)
    public createdCount: number = 0;

    public registeredTypes: collections.Array<string> = new collections.Array<string>();
    public logs: collections.Array<string> = new collections.Array<string>();

    private constructor() {
      this.logs.push('NamespaceUtilityFactorySendable created');
    }

    @LogMethodDecorator
    static getInstance(): NamespaceUtilityFactorySendable {
      if (NamespaceUtilityFactorySendable.instance === null) {
        NamespaceUtilityFactorySendable.instance = new NamespaceUtilityFactorySendable();
      }
      return NamespaceUtilityFactorySendable.instance;
    }

    @LogMethodDecorator
    static resetInstance(): void {
      if (NamespaceUtilityFactorySendable.instance !== null) {
        NamespaceUtilityFactorySendable.instance.logs.push('resetInstance');
        NamespaceUtilityFactorySendable.instance = null;
      }
    }

    @ValidateMethodDecorator
    @LogMethodDecorator
    validateFactory(): boolean {
      return this.factoryId.length > 0;
    }

    @LogMethodDecorator
    incrementCreatedCount(): void {
      this.createdCount = this.createdCount + 1;
      this.logs.push('incrementCreatedCount');
    }

    @LogMethodDecorator
    registerType(typeName: string): void {
      if (this.registeredTypes.indexOf(typeName) < 0) {
        this.registeredTypes.push(typeName);
        this.logs.push('registerType: ' + typeName);
      }
    }

    @LogMethodDecorator
    unregisterType(typeName: string): boolean {
      const index: number = this.registeredTypes.indexOf(typeName);
      if (index >= 0) {
        this.registeredTypes.splice(index, 1);
        this.logs.push('unregisterType: ' + typeName);
        return true;
      }
      return false;
    }

    private _factoryStatus: number = 0;

    @LogMethodDecorator
    get factoryStatus(): number {
      return this._factoryStatus;
    }

    set factoryStatus(newStatus: number) {
      if (newStatus >= 0 && newStatus <= 5) {
        this._factoryStatus = newStatus;
        this.logs.push('setter factoryStatus: ' + newStatus.toString());
      }
    }

    @LogMethodDecorator
    static getFactoryInfo(): string {
      return 'NamespaceUtilityFactorySendable';
    }
  }

  export const NAMESPACE_CONST_VALUE: number = 100;
  export const NAMESPACE_CONST_STRING: string = 'namespace_constant';
}

// Export namespace types for external use
export { SharedDatabaseNamespace, SharedUtilityNamespace };

// ========================================
// Mixed Method Types (Static + Getter + Setter + Async)
// ========================================

@Sendable
@Entity(userProfileConfig)
@LogClassDecorator
@ValidationClassDecorator
@ObservableClassDecorator
@MonitorClassDecorator
export class MixedMethodTypesSendable {
  @PrimaryKey
  @Column('mixed_id')
  public mixedId: string = '';

  @Column('name')
  public name: string = '';

  private _value: number = 0;
  private _status: number = 0;

  public logs: collections.Array<string> = new collections.Array<string>();

  private static instanceCount: number = 0;
  private static totalOperations: number = 0;

  constructor(mixedId: string, name: string) {
    this.mixedId = mixedId;
    this.name = name;
    MixedMethodTypesSendable.instanceCount = MixedMethodTypesSendable.instanceCount + 1;
  }

  // Getter
  @LogMethodDecorator
  get value(): number {
    this.logs.push('getter value');
    return this._value;
  }

  // Setter
  set value(newValue: number) {
    this._value = newValue;
    this.logs.push('setter value');
  }

  // Getter for status
  @LogMethodDecorator
  get status(): number {
    this.logs.push('getter status');
    return this._status;
  }

  // Setter for status
  set status(newStatus: number) {
    this._status = newStatus;
    this.logs.push('setter status');
  }

  // Normal method
  @LogMethodDecorator
  processData(): string {
    this.logs.push('processData');
    return 'Data processed';
  }

  // Async method
  @LogMethodDecorator
  async asyncProcessData(): Promise<string> {
    this.logs.push('asyncProcessData start');

    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    MixedMethodTypesSendable.totalOperations = MixedMethodTypesSendable.totalOperations + 1;
    this.logs.push('asyncProcessData success');
    return 'Async data processed';
  }

  // Static method
  @LogMethodDecorator
  static getInstanceCount(): number {
    return MixedMethodTypesSendable.instanceCount;
  }

  // Static method
  @LogMethodDecorator
  static getTotalOperations(): number {
    return MixedMethodTypesSendable.totalOperations;
  }

  // Static async method
  @LogMethodDecorator
  static async staticAsyncOperation(): Promise<number> {
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });

    return 100;
  }

  // Validate method
  @ValidateMethodDecorator
  @LogMethodDecorator
  validate(): boolean {
    return this.mixedId.length > 0 && this.name.length > 0;
  }

  // Async validate method
  @ValidateMethodDecorator
  @LogMethodDecorator
  async asyncValidate(): Promise<boolean> {
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 50);
    });

    return this.mixedId.length > 0;
  }

  // Getter that returns computed value
  @LogMethodDecorator
  get computedValue(): number {
    return this._value + this._status;
  }

  static createMixedInstance(id: string, name: string): MixedMethodTypesSendable {
    return new MixedMethodTypesSendable(id, name);
  }
}

export { SharedModuleDataSendable, SharedModuleEntitySendable } from './SharedModels';